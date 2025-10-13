import { useEffect, useState, useCallback } from 'react'
import { Notification, toast } from '@/components/ui'
import PendingRequests from './components/PendingRequests'
import ConversationList from './components/ConversationList'
import ChatWindow from './components/ChatWindow'
import { useWebSocket } from './hooks/useWebSocket'
import { chatApi } from './services/chatApi'
import {
    Conversation,
    ConversationDetail,
    Message,
    ConversationStatus,
    SenderRole,
    WebSocketMessage,
} from './types'
import { useAppSelector } from '@/store'

const ChatSupport = () => {
    const user = useAppSelector((state) => state.auth.user)
    const staffEmail = user?.email
    const staffId = user?.email  // ✅ Lấy staffId để gửi message

    console.log('[ChatSupport] Current Staff:', { staffEmail, staffId })

    const [pendingConversations, setPendingConversations] = useState<Conversation[]>([])
    const [myConversations, setMyConversations] = useState<Conversation[]>([])
    const [activeConversation, setActiveConversation] = useState<ConversationDetail | null>(null)
    const [messages, setMessages] = useState<Message[]>([])
    const [loading, setLoading] = useState(false)
    const [acceptingId, setAcceptingId] = useState<number | null>(null)
    const [typingUser, setTypingUser] = useState<string | null>(null)

    const { isConnected, subscribe, sendMessage } = useWebSocket()

    // Load pending conversations
    const loadPendingOnly = useCallback(async () => {
        try {
            setLoading(true)
            const pending = await chatApi.getPendingConversations()
            setPendingConversations(pending)
        } catch (error) {
            console.error('Error loading pending:', error)
            toast.push(<Notification type="danger" title="Error">Failed to load pending requests</Notification>)
        } finally {
            setLoading(false)
        }
    }, [])

    // Load staff's active conversations
    const loadMyConversations = useCallback(async () => {
        try {
            if (!staffEmail) return
            const myConvs = await chatApi.getMyConversations(staffEmail)
            setMyConversations(myConvs)
        } catch (error) {
            console.error('Error loading my conversations:', error)
            toast.push(<Notification type="danger" title="Error">Failed to load your conversations</Notification>)
        }
    }, [staffEmail])

    useEffect(() => { 
        loadPendingOnly()
        if (staffEmail) {
            loadMyConversations()
        }
    }, [loadPendingOnly, loadMyConversations, staffEmail])

    // ✅ WebSocket Subscriptions - Xử lý WebSocketResponse structure mới
    useEffect(() => {
        if (!isConnected) return

        // Subscribe pending requests
        const pendingSub = subscribe('/topic/staff/pending', (data: WebSocketMessage) => {
            console.log('[WS] Received on /topic/staff/pending:', data)
            if (data.type === 'NEW_REQUEST' || data.type === 'STATUS_CHANGE') {
                loadPendingOnly()
            }
        })

        // Subscribe removed pending
        const removedSub = subscribe('/topic/staff/pending/removed', (data: WebSocketMessage) => {
            console.log('[WS] Received on /topic/staff/pending/removed:', data)
            if (data.conversationId) {
                setPendingConversations((prev) => prev.filter((c) => c.id !== data.conversationId))
            }
        })

        return () => {
            pendingSub.unsubscribe()
            removedSub.unsubscribe()
        }
    }, [isConnected, subscribe, loadPendingOnly])

    // Active conversation updates
    useEffect(() => {
        if (!isConnected || !activeConversation) return

        const conversationSub = subscribe(`/topic/conversation/${activeConversation.id}`, (data: WebSocketMessage) => {
            console.log('[WS] Received on conversation topic:', data)
            
            // ✅ Xử lý MESSAGE - data nằm trong data.data
            if (data.type === 'MESSAGE' && data.data) {
                const messageData = data.data as Message
                setMessages((prev) => {
                    // Tránh duplicate message
                    const exists = prev.find(m => m.id === messageData.id)
                    if (exists) return prev
                    return [...prev, messageData]
                })
            } 
            // ✅ Xử lý STATUS_CHANGE
            else if (data.type === 'STATUS_CHANGE') {
                if (data.status === ConversationStatus.CLOSED) {
                    toast.push(<Notification type="info" title="Conversation Closed">{data.message || 'This conversation has been closed'}</Notification>)
                    loadPendingOnly()
                    loadMyConversations()
                    setActiveConversation({ ...activeConversation, status: ConversationStatus.CLOSED })
                }
            }
        })

        const typingSub = subscribe(`/topic/conversation/${activeConversation.id}/typing`, (data: WebSocketMessage) => {
            if (data.userName && data.isTyping) {
                setTypingUser(data.userName)
                setTimeout(() => setTypingUser(null), 3000)
            } else {
                setTypingUser(null)
            }
        })

        return () => {
            conversationSub.unsubscribe()
            typingSub.unsubscribe()
        }
    }, [isConnected, activeConversation, subscribe, loadPendingOnly, loadMyConversations])

    // Accept pending conversation
    const handleAcceptConversation = async (conversationId: number) => {
        try {
            if (!staffEmail) return
            setAcceptingId(conversationId)
            console.log('[ChatSupport] Accepting conversation', conversationId, 'by', staffEmail)

            const accepted = await chatApi.acceptConversation(conversationId, staffEmail)
            toast.push(<Notification type="success" title="Accepted">Conversation accepted successfully</Notification>)

            await Promise.all([loadPendingOnly(), loadMyConversations()])

            const detail = await chatApi.getConversationDetail(conversationId)
            setActiveConversation(detail)
            setMessages(detail.messages)
        } catch (error) {
            console.error('Error accepting conversation:', error)
            toast.push(<Notification type="danger" title="Error">Failed to accept conversation</Notification>)
        } finally {
            setAcceptingId(null)
        }
    }

    // Select conversation
    const handleSelectConversation = async (conversationId: number) => {
        try {
            setLoading(true)
            const detail = await chatApi.getConversationDetail(conversationId)
            setActiveConversation(detail)
            setMessages(detail.messages)
        } catch (error) {
            console.error('Error loading conversation detail:', error)
            toast.push(<Notification type="danger" title="Error">Failed to load conversation detail</Notification>)
        } finally {
            setLoading(false)
        }
    }

    // ✅ Send message - GỬI STAFF ID thay vì email
    const handleSendMessage = (content: string) => {
        if (!activeConversation || !staffId) {
            console.warn('[ChatSupport] Cannot send message: missing conversation or staffId')
            return
        }
        
        console.log('[ChatSupport] Sending message:', {
            conversationId: activeConversation.id,
            senderId: staffId,  // ✅ Gửi staffId (Long) thay vì email
            senderRole: SenderRole.STAFF,
            content
        })

        sendMessage({
            conversationId: activeConversation.id,
            senderId: staffId,  // ✅ QUAN TRỌNG: Gửi ID thay vì email
            senderRole: SenderRole.STAFF,
            content,
        })
    }

    // Close conversation
    const handleCloseConversation = async () => {
        if (!activeConversation || !staffEmail) return
        try {
            await chatApi.closeConversation(activeConversation.id, staffEmail)
            toast.push(<Notification type="success" title="Closed">Conversation closed successfully</Notification>)
            setActiveConversation({ ...activeConversation, status: ConversationStatus.CLOSED })
            loadPendingOnly()
            loadMyConversations()
        } catch (error) {
            console.error('Error closing conversation:', error)
            toast.push(<Notification type="danger" title="Error">Failed to close conversation</Notification>)
        }
    }

    // UI
    return (
        <div className="h-full">
            <div className="mb-4">
                <h2 className="text-2xl font-bold">Chat Support</h2>
                <p className="text-gray-500">
                    Manage customer support conversations
                    {isConnected ? (
                        <span className="ml-2 text-green-600">● Connected</span>
                    ) : (
                        <span className="ml-2 text-red-600">● Disconnected</span>
                    )}
                </p>
            </div>

            <div className="grid grid-cols-12 gap-4 h-[calc(100vh-200px)]">
                <div className="col-span-3">
                    <PendingRequests
                        conversations={pendingConversations}
                        onAccept={handleAcceptConversation}
                        loading={loading}
                        acceptingId={acceptingId}
                    />
                </div>

                <div className="col-span-3">
                    <ConversationList
                        conversations={myConversations}
                        activeConversationId={activeConversation?.id || null}
                        onSelectConversation={handleSelectConversation}
                    />
                </div>

                <div className="col-span-6">
                    <ChatWindow
                        conversation={activeConversation}
                        messages={messages}
                        currentStaffId={staffId}
                        onSendMessage={handleSendMessage}
                        onCloseConversation={handleCloseConversation}
                        loading={loading}
                        typingUser={typingUser}
                    />
                </div>
            </div>
        </div>
    )
}

export default ChatSupport