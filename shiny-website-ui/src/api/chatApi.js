import axiosClient from "./axiosClient";

const chatApi = {
  // Tạo conversation mới (customer gửi request)
  createConversation(customerId) {
    const url = `/chat/request`;
    return axiosClient.post(url, { customerId });
  },

  // Nhân viên accept conversation
  acceptConversation(conversationId, staffId) {
    const url = `/chat/${conversationId}/accept?staffId=${staffId}`;
    return axiosClient.post(url);
  },

  // Đóng conversation
  closeConversation(conversationId) {
    const url = `/chat/${conversationId}/close`;
    return axiosClient.post(url);
  },

  // Lấy tất cả message của conversation
  getMessages(conversationId) {
    const url = `/chat/${conversationId}/messages`;
    return axiosClient.get(url);
  },
};

export default chatApi;
