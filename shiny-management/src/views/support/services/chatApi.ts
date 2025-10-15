import ApiService from '@/services/ApiService'
import { Conversation, ConversationDetail, Message } from '../types'

const API_PREFIX = '/staff/chat'

export const chatApi = {
    /**
     * Lấy danh sách conversation đang PENDING
     * GET /api/v1/staff/chat/pending
     */
    getPendingConversations: async (): Promise<Conversation[]> => {
        const response = await ApiService.fetchData<Conversation[]>({
            url: `${API_PREFIX}/pending`,
            method: 'get',
        })
        return response.data
    },

    /**
     * Nhân viên chấp nhận conversation bằng EMAIL
     * POST /api/v1/staff/chat/{conversationId}/accept?staffEmail={email}
     */
    acceptConversation: async (conversationId: number, staffEmail: string): Promise<Conversation> => {
        const response = await ApiService.fetchData<Conversation>({
            url: `${API_PREFIX}/${conversationId}/accept?staffEmail=${staffEmail}`,
            method: 'post',
        })
        return response.data
    },

    /**
     * Đóng conversation bằng EMAIL
     * POST /api/v1/staff/chat/{conversationId}/close?staffEmail={email}
     */
    closeConversation: async (
        conversationId: number,
        staffEmail: string
    ): Promise<Conversation> => {
        const response = await ApiService.fetchData<Conversation>({
            url: `${API_PREFIX}/${conversationId}/close?staffEmail=${staffEmail}`,
            method: 'post',
        })
        return response.data
    },

    /**
     * Lấy danh sách conversation mà staff đang xử lý bằng EMAIL
     * GET /api/v1/staff/chat/my-conversations?staffEmail={email}
     */
    getMyConversations: async (staffEmail: string): Promise<Conversation[]> => {
        const response = await ApiService.fetchData<Conversation[]>({
            url: `${API_PREFIX}/my-conversations?staffEmail=${staffEmail}`,
            method: 'get',
        })
        return response.data
    },

    /**
     * Lấy chi tiết conversation bao gồm messages
     * GET /api/v1/staff/chat/{conversationId}/detail
     */
    getConversationDetail: async (
        conversationId: number
    ): Promise<ConversationDetail> => {
        const response = await ApiService.fetchData<ConversationDetail>({
            url: `${API_PREFIX}/${conversationId}/detail`,
            method: 'get',
        })
        return response.data
    },

    /**
     * Lấy danh sách message của conversation
     * GET /api/v1/chat/{conversationId}/messages
     */
    getMessages: async (conversationId: number): Promise<Message[]> => {
        const response = await ApiService.fetchData<Message[]>({
            url: `/chat/${conversationId}/messages`,
            method: 'get',
        })
        return response.data
    },

    /**
     * Kiểm tra conversation có thuộc về staff hay không bằng EMAIL
     * GET /api/v1/staff/chat/{conversationId}/verify?staffEmail={email}
     */
    verifyStaffConversation: async (
        conversationId: number,
        staffEmail: string
    ): Promise<{ isValid: boolean }> => {
        const response = await ApiService.fetchData<{ isValid: boolean }>({
            url: `${API_PREFIX}/${conversationId}/verify?staffEmail=${staffEmail}`,
            method: 'get',
        })
        return response.data
    },
}