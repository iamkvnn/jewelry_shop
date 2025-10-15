import { Card, Badge, Button, Avatar, Spinner } from '@/components/ui'
import { HiOutlineClock, HiOutlineUser } from 'react-icons/hi'
import { Conversation } from '../types'
import { formatDistanceToNow } from 'date-fns'

interface PendingRequestsProps {
    conversations: Conversation[]
    onAccept: (conversationId: number) => void
    loading?: boolean
    acceptingId?: number | null
}

const PendingRequests = ({
    conversations,
    onAccept,
    loading = false,
    acceptingId = null,
}: PendingRequestsProps) => {
    if (loading) {
        return (
            <Card className="h-full">
                <div className="flex items-center justify-center h-64">
                    <Spinner size={40} />
                </div>
            </Card>
        )
    }

    if (conversations.length === 0) {
        return (
            <Card className="h-full">
                <div className="flex flex-col items-center justify-center h-64 text-gray-500">
                    <HiOutlineClock className="text-6xl mb-4" />
                    <p className="text-lg">No pending requests</p>
                    <p className="text-sm">New chat requests will appear here</p>
                </div>
            </Card>
        )
    }

    return (
        <Card className="h-full">
            <div className="flex items-center justify-between mb-4 pb-4 border-b">
                <h3 className="text-lg font-semibold">Pending Requests</h3>
                <Badge className="bg-red-100 text-red-600">
                    {conversations.length}
                </Badge>
            </div>

            <div className="space-y-3 overflow-y-auto max-h-[calc(100vh-300px)]">
                {conversations.map((conv) => (
                    <div
                        key={conv.id}
                        className="p-4 border rounded-lg hover:bg-gray-50 transition-colors"
                    >
                        <div className="flex items-start justify-between gap-3">
                            <div className="flex items-start gap-3 flex-1">
                                <Avatar
                                    size={40}
                                    shape="circle"
                                    icon={<HiOutlineUser />}
                                    className="bg-blue-100 text-blue-600"
                                />
                                <div className="flex-1 min-w-0">
                                    <h4 className="font-semibold text-gray-900 truncate">
                                        {conv.customerName || `Customer #${conv.customerId}`}
                                    </h4>
                                    {conv.customerEmail && (
                                        <p className="text-sm text-gray-500 truncate">
                                            {conv.customerEmail}
                                        </p>
                                    )}
                                    <div className="flex items-center gap-2 mt-2">
                                        <HiOutlineClock className="text-gray-400" />
                                        <span className="text-xs text-gray-500">
                                            {formatDistanceToNow(
                                                new Date(new Date(conv.createdAt).getTime() + 7 * 60 * 60 * 1000),
                                                { addSuffix: true }
                                            )}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <Button
                                size="sm"
                                variant="solid"
                                onClick={() => onAccept(conv.id)}
                                loading={acceptingId === conv.id}
                                disabled={acceptingId !== null}
                            >
                                Accept
                            </Button>
                        </div>
                    </div>
                ))}
            </div>
        </Card>
    )
}

export default PendingRequests