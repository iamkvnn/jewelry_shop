import { useEffect, useRef, useState } from 'react'
import { Card, Button, Input, Avatar, Spinner, Badge } from '@/components/ui'
import {
    HiOutlinePaperAirplane,
    HiOutlineX,
    HiOutlineUser,
    HiOutlineChatAlt2,
} from 'react-icons/hi'
import { Message, SenderRole, ConversationDetail } from '../types'

interface ChatWindowProps {
    conversation: ConversationDetail | null
    messages: Message[]
    currentStaffId?: number
    onSendMessage: (content: string) => void
    onCloseConversation: () => void
    loading?: boolean
    typingUser?: string | null
}

const ChatWindow = ({
    conversation,
    messages,
    currentStaffId,
    onSendMessage,
    onCloseConversation,
    loading = false,
    typingUser = null,
}: ChatWindowProps) => {
    const [messageInput, setMessageInput] = useState('')
    const messagesEndRef = useRef<HTMLDivElement>(null)

    const scrollToBottom = () => {
        messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
    }

    useEffect(() => {
        scrollToBottom()
    }, [messages])

    const handleSend = () => {
        if (messageInput.trim()) {
            onSendMessage(messageInput.trim())
            setMessageInput('')
        }
    }

    const handleKeyPress = (e: React.KeyboardEvent) => {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault()
            handleSend()
        }
    }

    if (!conversation) {
        return (
            <Card className="h-full">
                <div className="flex flex-col items-center justify-center h-full text-gray-500">
                    <HiOutlineChatAlt2 className="text-6xl mb-4" />
                    <p className="text-lg">Select a conversation</p>
                    <p className="text-sm">Choose a conversation to start chatting</p>
                </div>
            </Card>
        )
    }

    return (
        <Card className="h-full flex flex-col">
            {/* Header */}
            <div className="flex items-center justify-between p-4 border-b">
                <div className="flex items-center gap-3">
                    <Avatar
                        size={40}
                        shape="circle"
                        icon={<HiOutlineUser />}
                        className="bg-blue-100 text-blue-600"
                    />
                    <div>
                        <h3 className="font-semibold">
                            {conversation.customerName ||
                                `Customer #${conversation.customerId}`}
                        </h3>
                        {conversation.customerEmail && (
                            <p className="text-xs text-gray-500">
                                {conversation.customerEmail}
                            </p>
                        )}
                    </div>
                </div>

                {conversation.status === 'ACCEPTED' && (
                    <Button
                        size="sm"
                        variant="solid"
                        color="red-600"
                        icon={<HiOutlineX />}
                        onClick={onCloseConversation}
                    >
                        Close Chat
                    </Button>
                )}
            </div>

            {/* Messages */}
            <div className="flex-1 overflow-y-auto p-4 space-y-4">
                {loading ? (
                    <div className="flex items-center justify-center h-full">
                        <Spinner size={40} />
                    </div>
                ) : messages.length === 0 ? (
                    <div className="flex items-center justify-center h-full text-gray-400">
                        <p>No messages yet. Start the conversation!</p>
                    </div>
                ) : (
                    <>
                        {messages.map((msg) => {
                            const isStaff = msg.senderRole === SenderRole.STAFF
                            const isCurrentUser = 
                                isStaff && 
                                currentStaffId !== undefined && 
                                msg.senderId === currentStaffId
                            
                            return (
                                <div
                                    key={msg.id}
                                    className={`flex ${isCurrentUser ? 'justify-end' : 'justify-start'}`}
                                >
                                    <div
                                        className={`max-w-[70%] ${
                                            isCurrentUser
                                                ? 'bg-blue-500 text-white' // ✅ Tin nhắn của staff hiện tại (bên phải)
                                                : 'bg-gray-100 text-gray-900' // ✅ Tin nhắn của customer (bên trái)
                                        } rounded-lg px-4 py-2`}
                                    >
                                        {!isCurrentUser && (
                                            <div className="flex items-center gap-2 mb-1">
                                                <span className="text-xs font-semibold">
                                                    {isStaff ? 'Staff' : 'Customer'}
                                                </span>
                                                <span className="text-gray-600 text-xs">
                                                    ID: {msg.senderId}
                                                </span>
                                            </div>
                                        )}
                                        <p className="whitespace-pre-wrap break-words">
                                            {msg.content}
                                        </p>
                                        <p
                                            className={`text-xs mt-1 ${
                                                isCurrentUser
                                                    ? 'text-blue-100'
                                                    : 'text-gray-500'
                                            }`}
                                        >
                                            {new Date(new Date(msg.sentAt).getTime() + 7 * 60 * 60 * 1000).toLocaleTimeString()}
                                        </p>
                                    </div>
                                </div>
                            )
                        })}
                        <div ref={messagesEndRef} />
                    </>
                )}

                {typingUser && (
                    <div className="flex items-center gap-2 text-gray-500 text-sm">
                        <span className="italic">{typingUser} is typing</span>
                        <span className="animate-pulse">...</span>
                    </div>
                )}
            </div>

            {/* Input */}
            {conversation.status === 'ACCEPTED' && (
                <div className="p-4 border-t">
                    <div className="flex gap-2">
                        <Input
                            placeholder="Type your message..."
                            value={messageInput}
                            onChange={(e) => setMessageInput(e.target.value)}
                            onKeyPress={handleKeyPress}
                            disabled={loading}
                        />
                        <Button
                            variant="solid"
                            icon={<HiOutlinePaperAirplane />}
                            onClick={handleSend}
                            disabled={!messageInput.trim() || loading}
                        >
                            Send
                        </Button>
                    </div>
                </div>
            )}

            {conversation.status === 'CLOSED' && (
                <div className="p-4 border-t bg-gray-50 text-center text-gray-500">
                    This conversation has been closed
                </div>
            )}
        </Card>
    )
}

export default ChatWindow