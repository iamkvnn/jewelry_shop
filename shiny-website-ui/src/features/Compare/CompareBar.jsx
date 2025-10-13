import { useSelector, useDispatch } from "react-redux";
import { Button } from "@mui/material";
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import { removeFromCompare, clearCompare } from "./compareSlice";
import ProductSearchModal from "./ProductSearchModal";
import { toast } from "react-toastify";
import styles from "./CompareBar.module.css";

export default function CompareBar() {
  const items = useSelector((s) => s.compare.items);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [searchModalOpen, setSearchModalOpen] = useState(false);

  const handleCompareClick = () => {
    if (items.length < 2) {
      toast.warning("Vui lòng chọn từ 2 sản phẩm trở lên để so sánh");
      return;
    }
    navigate("/compare");
  };

  if (items.length === 0) return null;

  return (
    <div className={styles.compareBar}>
      <div className={styles.container}>
        <div className={styles.itemsContainer}>
          {items.map((p) => (
            <div key={p.id} className={styles.productItem}>
              <img src={p.image} alt={p.title} className={styles.productImage} />
              <span className={styles.productTitle}>{p.title}</span>
              <Button color="error" size="small" onClick={() => dispatch(removeFromCompare(p.id))}>X</Button>
            </div>
          ))}
        </div>
        <div className={styles.buttonsContainer}>
          <Button variant="outlined" color="primary" onClick={() => setSearchModalOpen(true)}>
            + Thêm sản phẩm
          </Button>
          <Button variant="outlined" color="inherit" onClick={() => dispatch(clearCompare())}>Xóa</Button>
          <Button 
            variant="contained" 
            onClick={handleCompareClick}
          >
            So sánh ngay ({items.length})
          </Button>
        </div>
      </div>
      
      <ProductSearchModal 
        open={searchModalOpen} 
        onClose={() => setSearchModalOpen(false)} 
      />
    </div>
  );
}


