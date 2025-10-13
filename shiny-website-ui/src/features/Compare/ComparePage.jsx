import { useMemo, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { removeFromCompare, clearCompare } from "./compareSlice";
import { Button } from "@mui/material";
import { useNavigate } from "react-router-dom";
import styles from "./ComparePage.module.css";

const currency = (v) =>
  typeof v === "number" ? new Intl.NumberFormat("vi-VN").format(v) + "đ" : v ?? "-";

export default function ComparePage() {
  const items = useSelector((s) => s.compare.items);
  const dispatch = useDispatch();
  const navigate = useNavigate();

  // Xóa dữ liệu compare khi thoát khỏi trang Compare
  useEffect(() => {
    return () => {
      // Cleanup function - chạy khi component unmount
      dispatch(clearCompare());
    };
  }, [dispatch]);

  const headers = useMemo(() => items.map((p) => p.title), [items]);

  const rows = useMemo(() => {
    // Thu thập tất cả các attribute names từ tất cả sản phẩm
    const allAttributeNames = new Set();
    items.forEach((product) => {
      if (Array.isArray(product.attributes)) {
        product.attributes.forEach((attr) => {
          allAttributeNames.add(attr.name);
        });
      }
    });

    const fields = [
      { key: "categoryName", label: "Danh mục" },
      { key: "collectionName", label: "Bộ sưu tập" },
      { key: "status", label: "Trạng thái" },
      { key: "material", label: "Chất liệu" },
      { key: "sizes", label: "Kích cỡ & giá" },

      ...Array.from(allAttributeNames).map((attrName) => ({
        key: `attribute_${attrName}`,
        label: attrName,
        isAttribute: true,
      })),

    ];

    return fields.map((f) => ({
      label: f.label,
      values: items.map((p) => {
        if (f.key === "status") {
          if (p.status == "IN_STOCK") return "Có sẵn";
          if (p.status == "OUT_OF_STOCK") return "Hết hàng";
          if (p.status == "NOT_AVAILABLE") return "Không có sẵn";
          return "-";
        }
        if (f.key === "sizes") {
          const sizes = Array.isArray(p.productSizes) ? p.productSizes : [];
          if (!sizes.length) return "-";
          return sizes
            .map((s) => `${s.size === "No size" ? "One size" : s.size}: ${currency(s.discountPrice ?? s.price)}`)
            .join(", ");
        }
        if (f.isAttribute) {
          // Tìm giá trị của attribute cụ thể
          const attrs = Array.isArray(p.attributes) ? p.attributes : [];
          const foundAttr = attrs.find((attr) => attr.name === f.label);
          return foundAttr ? foundAttr.value : "-";
        }
        return p[f.key] ?? "-";
      }),
    }));
  }, [items]);

  if (!items.length) {
    return (
      <div className={styles.emptyState}>
        <div className={styles.emptyIcon}>🔍</div>
        <h2 className={styles.emptyTitle}>Chưa có sản phẩm nào để so sánh</h2>
        <p className={styles.emptyDescription}>
          Hãy chọn ít nhất 2 sản phẩm từ danh sách sản phẩm để bắt đầu so sánh
        </p>
        <Button
          variant="contained"
          color="primary"
          size="large"
          onClick={() => navigate("/products")}
          className={styles.emptyButton}
        >
          🛍️ Chọn sản phẩm để so sánh
        </Button>
      </div>
    );
  }

  return (
    <div className={styles.comparePage}>
      <div className={styles.header}>
        <h2 className={styles.title}>So sánh sản phẩm</h2>
        <Button color="error" onClick={() => dispatch(clearCompare())}>
          Xóa tất cả
        </Button>
      </div>

      <div className={styles.tableContainer}>
        <table className={styles.compareTable}>
          <thead>
            <tr>
              <th className={styles.tableHeader}></th>
              {items.map((p) => (
                <th key={p.id} className={styles.tableHeader}>
                  <div className={styles.productHeader}>
                    <img
                      src={p.image}
                      alt={p.title}
                      className={styles.productImage}
                    />
                    <div className={styles.productInfo}>
                      <span className={styles.productTitle}>{p.title}</span>
                      <Button
                        size="small"
                        color="error"
                        onClick={() => dispatch(removeFromCompare(p.id))}
                      >
                        Bỏ khỏi so sánh
                      </Button>
                    </div>
                  </div>
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.map((r) => (
              <tr key={r.label}>
                <td className={styles.labelCell}>{r.label}</td>
                {r.values.map((v, idx) => (
                  <td key={idx} className={styles.tableCell}>
                    {v}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}


