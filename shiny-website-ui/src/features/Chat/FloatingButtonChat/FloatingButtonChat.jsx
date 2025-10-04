import { faHeadset } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import PropTypes from "prop-types";
import styles from "./FloatingButtonChat.module.css";

function FloatingButtonChat({ onClick }) {
  return (
    <button className={styles.floatingButtonChat} onClick={onClick}>
      <FontAwesomeIcon icon={faHeadset} size="2x" />
    </button>
  );
}

FloatingButtonChat.propTypes = {
  onClick: PropTypes.func.isRequired,
};

export default FloatingButtonChat;
