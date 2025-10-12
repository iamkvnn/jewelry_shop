import { useState } from "react";
import { useSelector } from "react-redux";
import FloatingButtonChat from "./FloatingButtonChat/FloatingButtonChat";
import WindowChat from "./WindowChat/WindowChat";

function ChatContainer() {
  const [isChatOpen, setIsChatOpen] = useState(false);
  const userInfo = useSelector((state) => state.user.current);

  // Chỉ hiển thị chat khi user đã đăng nhập
  if (!userInfo || Object.keys(userInfo).length === 0) {
    return null;
  }

  const toggleChat = () => {
    setIsChatOpen(!isChatOpen);
  };

  const closeChat = () => {
    setIsChatOpen(false);
  };

  return (
    <>
      <FloatingButtonChat onClick={toggleChat} />
      <WindowChat isOpen={isChatOpen} onClose={closeChat} />
    </>
  );
}

export default ChatContainer;
