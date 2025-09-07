import MenuOpenRoundedIcon from "@mui/icons-material/MenuOpenRounded";
import SearchRoundedIcon from "@mui/icons-material/SearchRounded";
import FavoriteBorderRoundedIcon from "@mui/icons-material/FavoriteBorderRounded";
import PermIdentityOutlinedIcon from "@mui/icons-material/PermIdentityOutlined";
import ShoppingBagOutlinedIcon from "@mui/icons-material/ShoppingBagOutlined";
import ReceiptLongOutlinedIcon from "@mui/icons-material/ReceiptLongOutlined";
import NotificationsOutlinedIcon from "@mui/icons-material/NotificationsOutlined";
import React, { useState } from "react";
import styles from "./Header.module.css";
import { Menu, MenuItem } from "@mui/material";
import { useDispatch, useSelector } from "react-redux";
import { logout } from "../../features/LoginSignin/store/authSlice";
import { useNavigate } from "react-router-dom";
import Popover from "@mui/material/Popover";
import notificationApi from "../../api/notificationApi";
import LoginIcon from "@mui/icons-material/Login";
import LogoutIcon from "@mui/icons-material/Logout";
import AppRegistrationIcon from "@mui/icons-material/AppRegistration";
import ContactPageIcon from "@mui/icons-material/ContactPage";
import Notification from "../Alert";
import Tooltip from "@mui/material/Tooltip"; // Import Tooltip

export default function Header() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const userInfo = useSelector((state) => state.user.current);

  const [notificationAnchor, setNotificationAnchor] = useState(null);
  const [notifications, setNotifications] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [notification, setNotification] = useState({
    open: false,
    message: "",
    severity: "success",
  });


  const [anchorEl, setAnchorEl] = React.useState(null);
  const open = Boolean(anchorEl);

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleOrder = () => {
    if (!userInfo || Object.keys(userInfo).length === 0) {
      setNotification({
        open: true,
        message: "Bạn cần đăng nhập để xem đơn hàng!",
        severity: "warning",
      });
      return;
    }
    navigate("/myorder");
  };

  const handleNotificationClick = async (event) => {
    if (!userInfo || !userInfo.id) {
      setNotification({
        open: true,
        message: "Bạn cần đăng nhập để có thể nhận thông báo!",
        severity: "warning",
      });
      return;
    }
    setNotificationAnchor(event.currentTarget);
      const response = await notificationApi.getAllNotifications();
      const notificationsData = response?.data?.content || [];
      setNotifications(notificationsData);
  };

  const handleNotificationClose = () => {
    setNotificationAnchor(null);
  };

  const handleToggleReadStatus = async (index) => {
    const notification = notifications[index];
      await notificationApi.toggleReadStatus(notification.id);

      // Cập nhật trạng thái trong state
      setNotifications((prevNotifications) => {
        const updatedNotifications = [...prevNotifications];
        updatedNotifications[index].status = "READ";
        return updatedNotifications;
      });
  };

  const isNotificationOpen = Boolean(notificationAnchor);
  const notificationId = isNotificationOpen
    ? "notification-popover"
    : undefined;

  const handleGoToCart = () => {
    if (!userInfo || Object.keys(userInfo).length === 0) {
      setNotification({
        open: true,
        message: "Bạn cần đăng nhập để xem giỏ hàng!",
        severity: "warning",
      });
      return;
    }
    navigate("/cart");
  };

  const handleLogout = () => {
    dispatch(logout());
    navigate("/");
    setAnchorEl(null);
  };

  const handleLogin = () => {
    navigate("/login");
    setAnchorEl(null);
  };
  const handleSignIn = () => {
    navigate("/register");
    setAnchorEl(null);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleProfileClick = () => {
    navigate("/infocus");
    setAnchorEl(null);
  };

  const handleSearch = () => {
    if (searchQuery.trim()) {
      // Chuyển hướng đến trang tìm kiếm với query
      navigate(`/products?query=${encodeURIComponent(searchQuery)}`);
    }
  };

  const handleKeyPress = (event) => {
    if (event.key === "Enter") {
      handleSearch();
    }
  };

  const handleWishlistClick = () => {
    if (!userInfo || Object.keys(userInfo).length === 0) {
      setNotification({
        open: true,
        message: "Bạn cần đăng nhập để xem danh sách yêu thích!",
        severity: "warning",
      });
      return;
    }
    navigate("/wishlist");
  };

  return (
    <nav>
      {notification.open && (
        <Notification
          severity={notification.severity}
          message={notification.message}
          open={notification.open}
          setOpen={() => setNotification({ ...notification, open: false })}
          variant="filled"
        />
      )}
      <div className={styles.on}>
        <div className={styles.logo}>
          <a href="/">
            <img
              src="../image/logo/logo.jpg"
              height="90"
              width="150"
              alt="Logo"
            ></img>
          </a>
        </div>
        <div className={styles.navIcons}>
          <input
            type="text"
            placeholder="Search products..."
            className={styles.searchInput}
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            onKeyPress={handleKeyPress}
          />
          <SearchRoundedIcon fontSize="large" onClick={handleSearch} />
          <MenuOpenRoundedIcon fontSize="large" />
        </div>
      </div>
      <div className={styles.duongke}></div>
      <div className={styles.below}>
        <div className={styles.items}>
          <a className={styles.link} href="/">
            Home
          </a>
          <a className={styles.link} href="/products">
            Products
          </a>
          <a className={styles.link} href="/privacy-and-term">
            Privacy & Term
          </a>
        </div>
        <div className={styles.icons}>
        <Tooltip
            title="Danh sách yêu thích"
            classes={{ tooltip: styles.customTooltip, arrow: styles.customTooltipArrow }}
            placement="bottom"
            arrow
          >
            <FavoriteBorderRoundedIcon onClick={handleWishlistClick} />
          </Tooltip>
          <Tooltip
            title="Đơn hàng của tôi"
            classes={{ tooltip: styles.customTooltip, arrow: styles.customTooltipArrow }}
            placement="bottom"
            arrow
          >
            <ReceiptLongOutlinedIcon
              className={styles.icon}
              onClick={handleOrder}
            />
          </Tooltip>
          <Tooltip
            title="Thông báo"
            classes={{ tooltip: styles.customTooltip, arrow: styles.customTooltipArrow }}
            placement="bottom"
            arrow
          >
            <NotificationsOutlinedIcon
              className={styles.icon}
              aria-describedby={notificationId}
              onClick={handleNotificationClick}
            />
          </Tooltip>
          <Popover
            id={notificationId}
            open={isNotificationOpen}
            anchorEl={notificationAnchor}
            onClose={handleNotificationClose}
            anchorOrigin={{
              vertical: "bottom",
              horizontal: "center",
            }}
            transformOrigin={{
              vertical: "top",
              horizontal: "center",
            }}
            disableEnforceFocus
          >
            <div className={styles.notificationList}>
              {notifications.length > 0 ? (
                notifications.map((notification, index) => (
                  <div
                    key={notification.id}
                    className={`${styles.notificationListItem} ${
                      notification.status === "UNREAD"
                        ? styles.unread
                        : styles.read
                    }`}
                  >
                    <div className={styles.notificationHeader}>
                      <span className={styles.notificationTitle}>
                        {notification.title}
                      </span>
                      <span
                        className={
                          notification.status === "UNREAD"
                            ? styles.unreadStatus
                            : styles.readStatus
                        }
                      >
                        {notification.status === "UNREAD"
                          ? "Chưa xem"
                          : "Đã xem"}
                      </span>
                    </div>
                    <p className={styles.notificationContent}>
                      {notification.content}
                    </p>
                    <small className={styles.notificationTime}>
                      {new Date(notification.sentAt).toLocaleString()}
                    </small>
                    {notification.status === "UNREAD" && (
                      <button
                        className={styles.markButton}
                        onClick={() => handleToggleReadStatus(index)}
                      >
                        Đánh dấu đã xem
                      </button>
                    )}
                  </div>
                ))
              ) : (
                <p className={styles.notificationEmpty}>
                  You have no new notifications.
                </p>
              )}
            </div>
          </Popover>
          <Tooltip
            title="Thông tin cá nhân"
            classes={{ tooltip: styles.customTooltip, arrow: styles.customTooltipArrow }}
            placement="bottom"
            arrow
          >
            <PermIdentityOutlinedIcon onClick={handleClick} />
          </Tooltip>
          <Menu
            id="user-menu"
            anchorEl={anchorEl}
            open={open}
            onClose={handleClose}
            sx={{ marginTop: "5px" }}
            MenuListProps={{
              "aria-labelledby": "basic-button",
            }}
          >
            {Object.keys(userInfo).length === 0
              ? [
                  <MenuItem key="login" onClick={handleLogin}>
                    <LoginIcon sx={{ marginRight: "5px" }} />
                    Đăng nhập
                  </MenuItem>,
                  <MenuItem key="register" onClick={handleSignIn}>
                    <AppRegistrationIcon sx={{ marginRight: "5px" }} />
                    Đăng ký
                  </MenuItem>,
                ]
              : [
                  <MenuItem key="profile" onClick={handleProfileClick}>
                    <ContactPageIcon sx={{ marginRight: "5px" }} />
                    Thông tin cá nhân
                  </MenuItem>,
                  <MenuItem key="logout" onClick={handleLogout}>
                    <LogoutIcon sx={{ marginRight: "5px" }} />
                    Đăng xuất
                  </MenuItem>,
                ]}
          </Menu>
          <Tooltip
            title="Giỏ hàng"
            classes={{ tooltip: styles.customTooltip, arrow: styles.customTooltipArrow }}
            placement="bottom"
            arrow
          >
            <ShoppingBagOutlinedIcon onClick={handleGoToCart} />
          </Tooltip>
        </div>
      </div>
    </nav>
  );
}
