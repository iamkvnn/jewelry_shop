// src/views/support/ChatSupport/components/ConversationList.tsx

import { Card, Badge, Avatar, Input } from '@/components/ui'
import { HiOutlineUser, HiOutlineSearch } from 'react-icons/hi'
import { Conversation, ConversationStatus } from '../types'
import { formatDistanceToNow } from 'date-fns'
import { useState, useEffect } from 'react'

interface ConversationListProps {
    conversations: Conversation[]
    activeConversationId: number | null
    onSelectConversation: (conversationId: number) => void
}

const ConversationList = ({
    conversations,
    activeConversationId,
    onSelectConversation,
}: ConversationListProps) => {
    const [searchQuery, setSearchQuery] = useState('')

    useEffect(() => {
    }, [conversations])

    useEffect(() => {
    }, [searchQuery])

    const filteredConversations = conversations.filter((conv) => {
        const searchLower = searchQuery.toLowerCase()
        return (
            conv.customerName?.toLowerCase().includes(searchLower) ||
            conv.customerEmail?.toLowerCase().includes(searchLower) ||
            conv.id.toString().includes(searchLower)
        )
    })

    const getStatusBadge = (status: ConversationStatus) => {
        const statusConfig = {
            [ConversationStatus.ACCEPTED]: {
                className: 'bg-green-100 text-green-600',
                text: 'Active',
            },
            [ConversationStatus.PENDING]: {
                className: 'bg-yellow-100 text-yellow-600',
                text: 'Pending',
            },
            [ConversationStatus.CLOSED]: {
                className: 'bg-gray-100 text-gray-600',
                text: 'Closed',
            },
        }
        return statusConfig[status] || statusConfig[ConversationStatus.CLOSED]
    }

    // ✅ Log danh sách sau khi lọc
    useEffect(() => {
    }, [filteredConversations])

    return (
        <Card className="h-full">
            <div className="mb-4 pb-4 border-b">
                <h3 className="text-lg font-semibold mb-3">My Conversations</h3>
                <Input
                    placeholder="Search conversations..."
                    prefix={<HiOutlineSearch className="text-gray-400" />}
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                />
            </div>

            {filteredConversations.length === 0 ? (
                <div className="flex flex-col items-center justify-center h-64 text-gray-500">
                    <HiOutlineUser className="text-6xl mb-4" />
                    <p className="text-lg">No conversations yet</p>
                    <p className="text-sm">Accept a pending request to start chatting</p>
                </div>
            ) : (
                <div className="space-y-2 overflow-y-auto max-h-[calc(100vh-300px)]">
                    {filteredConversations.map((conv) => {
                        const statusBadge = getStatusBadge(conv.status)
                        const isActive = conv.id === activeConversationId

                        return (
                            <div
                                key={conv.id}
                                onClick={() => {
                                    onSelectConversation(conv.id)
                                }}
                                className={`p-3 rounded-lg cursor-pointer transition-all ${
                                    isActive
                                        ? 'bg-blue-50 border-2 border-blue-500'
                                        : 'border border-gray-200 hover:bg-gray-50'
                                }`}
                            >
                                <div className="flex items-start gap-3">
                                    <Avatar
                                        size={40}
                                        shape="circle"
                                        icon={<HiOutlineUser />}
                                        className={
                                            isActive
                                                ? 'bg-blue-500 text-white'
                                                : 'bg-gray-200 text-gray-600'
                                        }
                                    />
                                    <div className="flex-1 min-w-0">
                                        <div className="flex items-center justify-between gap-2 mb-1">
                                            <h4 className="font-semibold text-sm truncate">
                                                {conv.customerName ||
                                                    `Customer #${conv.customerId}`}
                                            </h4>
                                            <Badge
                                                className={`${statusBadge.className} text-xs`}
                                            >
                                                {statusBadge.text}
                                            </Badge>
                                        </div>
                                        {conv.customerEmail && (
                                            <p className="text-xs text-gray-500 truncate mb-1">
                                                {conv.customerEmail}
                                            </p>
                                        )}
                                        <p className="text-xs text-gray-400">
                                            {formatDistanceToNow(new Date(conv.updatedAt), {
                                                addSuffix: true,
                                            })}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        )
                    })}
                </div>
            )}
        </Card>
    )
}

export default ConversationList
