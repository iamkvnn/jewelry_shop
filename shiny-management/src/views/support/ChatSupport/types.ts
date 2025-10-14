// src/views/support/ChatSupport/types.ts

export enum ConversationStatus {
    PENDING = 'PENDING',
    ACCEPTED = 'ACCEPTED',
    CLOSED = 'CLOSED',
}

export enum SenderRole {
    STAFF = 'STAFF',
    CUSTOMER = 'CUSTOMER',
}

export interface Conversation {
    id: number
    customerId: number
    customerName?: string
    customerEmail?: string
    staffId?: number  // ✅ Thêm optional staffId
    createdAt: string
    updatedAt: string
    status: ConversationStatus
}

export interface Message {
    id: number
    conversationId: number
    senderId: number
    senderRole: SenderRole
    content: string
    sentAt: string
}

export interface ConversationDetail extends Conversation {
    messages: Message[]
}

/**
 * ✅ WebSocket Message structure - chuẩn hóa theo Backend
 */
export interface WebSocketMessage {
    // Message type
    type?: 
        | "MESSAGE"           // Tin nhắn chat
        | "STATUS"           // Status change cho customer
        | "STATUS_CHANGE"    // Status change cho staff
        | "NEW_REQUEST"      // Request mới
        | "REMOVED"          // Conversation removed from pending
        | "ACCEPTED"         // Conversation accepted
        | "CLOSED"           // Conversation closed
        | "RAW"              // Raw message
    
    // Status của conversation
    status?: "PENDING" | "ACCEPTED" | "CLOSED"
    
    // Message text
    message?: string
    
    // Data payload (MessageResponse, ConversationResponse, etc.)
    data?: Message | Conversation | any
    
    // IDs
    conversationId?: number
    staffId?: number
    staffEmail?: string
    
    // Typing indicator
    userName?: string
    isTyping?: boolean
    
    // Sender info
    senderRole?: "CUSTOMER" | "STAFF"
}

// Redux type
export interface UserState {
    id: number
    userName: string
    email?: string
}