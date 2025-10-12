import { useState, useEffect, useMemo } from "react";
import {
  Dialog, DialogTitle, DialogContent, DialogActions,
  Button, TextField, Box, Grid, Card, CardMedia,
  CardContent, Typography, CircularProgress
} from "@mui/material";
import { useDispatch, useSelector } from "react-redux";
import { addToCompare } from "./compareSlice";
import productApi from "../../api/productApi";
import categoryApi from "../../api/categoryApi";
import { toast } from "react-toastify";

const formatPrice = (price) => new Intl.NumberFormat("vi-VN").format(price) + "₫";
const PAGE_SIZE = 12;

export default function ProductSearchModal({ open, onClose }) {
  const [searchQuery, setSearchQuery] = useState("");
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(false);
  const [page, setPage] = useState(1);
  const [hasMore, setHasMore] = useState(true);
  const [categories, setCategories] = useState([]);

  const dispatch = useDispatch();
  const compareItems = useSelector((state) => state.compare.items);

  const categoryMap = useMemo(() => {
    const map = new Map();
    categories.forEach((c) => map.set(c.id, c));
    return map;
  }, [categories]);

  const getParentCategoryId = (productCategoryId) => {
    const category = categoryMap.get(productCategoryId);
    if (category?.parent) return category.parent.id;

    // nếu không có parent, kiểm tra có child không
    const hasChild = categories.some((cat) => cat.parent?.id === productCategoryId);

    return productCategoryId;
  };

  // Tải categories khi mở modal
  useEffect(() => {
    if (!open) return;
    (async () => {
      try {
        const res = await categoryApi.getAllCategories();
        setCategories(res.data || []);
      } catch (e) {
        console.error("Error loading categories:", e);
        setCategories([]);
      }
    })();
  }, [open]);

  // Khi categories đã sẵn sàng (và modal mở), reset & load trang 1
  useEffect(() => {
    if (!open) return;
    // chờ categories có (hoặc quyết định: nếu so sánh trống thì vẫn cho load)
    if (compareItems.length > 0 && categories.length === 0) return;

    // reset
    setProducts([]);
    setPage(1);
    setHasMore(true);
    // load trang đầu
    loadProducts({ reset: true, pageOverride: 1 });

  }, [open, categories]);

  // Khi compareItems thay đổi (đặc biệt 0→1), reset & load lại để lọc theo nhóm mới
  useEffect(() => {
    if (!open) return;
    if (compareItems.length > 0 && categories.length === 0) return;

    setProducts([]);
    setPage(1);
    setHasMore(true);
    loadProducts({ reset: true, pageOverride: 1 });

  }, [compareItems]);

  // Debounce search; chặn khi chưa sẵn sàng
  useEffect(() => {
    if (!open) return;
    if (compareItems.length > 0 && categories.length === 0) return;

    const id = setTimeout(() => {
      setProducts([]);
      setPage(1);
      setHasMore(true);
      loadProducts({ reset: true, pageOverride: 1 });
    }, 300);
    return () => clearTimeout(id);
    
  }, [searchQuery]);

  const buildFilterParamsByCompare = () => {
    const params = {};
    if (compareItems.length === 0) return params;

    const firstParent = getParentCategoryId(compareItems[0].categoryId);
    const childCats = categories.filter((c) => c.parent?.id === firstParent);

    if (childCats.length > 0) {
      params.categories = [firstParent, ...childCats.map((c) => c.id)];
    } else {
      params.categoryId = firstParent;
    }
    return params;
  };

  const loadProducts = async ({ reset = false, pageOverride } = {}) => {
    if (loading) return;

    // Guard: nếu đang có item so sánh mà categories chưa sẵn sàng → dừng
    if (compareItems.length > 0 && categories.length === 0) return;

    setLoading(true);
    try {
      const nextPage = reset ? (pageOverride || 1) : page;
      const params = {
        page: nextPage,
        size: PAGE_SIZE,
        ...buildFilterParamsByCompare(),
      };
      if (searchQuery?.trim()) params.title = searchQuery.trim();

      const response = await productApi.searchAndFilterProducts({ params });
      const newProducts = response?.data?.content || [];

      // Lọc lại theo parent category
      const filtered = compareItems.length > 0
        ? newProducts.filter((product) => {
            const productCatId = product?.category?.id;
            if (!productCatId) return false;

            const firstParent = getParentCategoryId(compareItems[0].categoryId);
            const productParent = getParentCategoryId(productCatId);

            if (productParent === firstParent) return true;

            const productCat = categoryMap.get(productCatId);
            if (productCat?.parent?.id === firstParent) return true;

            const firstItemCategory = categoryMap.get(compareItems[0].categoryId);
            if (firstItemCategory?.parent?.id === productParent) return true;

            return false;
          })
        : newProducts;

      if (reset) {
        setProducts(filtered);
        setPage(nextPage + 1);
        setHasMore(filtered.length === PAGE_SIZE);
      } else {
        setProducts((prev) => [...prev, ...filtered]);
        setPage((prev) => prev + 1);
        setHasMore(newProducts.length === PAGE_SIZE);
      }
    } catch (error) {
      console.error("Error loading products:", error);
      toast.error("Có lỗi khi tải sản phẩm");
    } finally {
      setLoading(false);
    }
  };

  const handleAddToCompare = (product) => {
    // kiểm tra parent category trước khi thêm
    if (compareItems.length > 0) {
      const firstParent = getParentCategoryId(compareItems[0].categoryId);
      const productParent = getParentCategoryId(product?.category?.id);
      if (productParent !== firstParent) {
        toast.error("Chỉ có thể so sánh sản phẩm cùng loại");
        return;
      }
    }

    const image = product?.images?.[0]?.url || "/logo.png";
    dispatch(
      addToCompare({
        id: product.id,
        title: product.title,
        image,
        categoryId: product?.category?.id,
        categoryName: product?.category?.name,
        collectionName: product?.collection?.name,
        material: product?.material,
        productSizes: product?.productSizes || [],
        status: product?.status,
        createdAt: product?.createdAt,
        attributes: product?.attributes || [],
        description: product?.description || "",
      })
    );
    toast.success("Đã thêm vào danh sách so sánh");
  };

  const isInCompareList = (productId) => compareItems.some((item) => item.id === productId);

  const canAddToCompare = (product) => {
    if (compareItems.length === 0) return true;
    if (compareItems.length >= 4) return false;

    const firstParent = getParentCategoryId(compareItems[0].categoryId);
    const productParent = getParentCategoryId(product?.category?.id);
    if (productParent === firstParent) return true;

    const productCategory = categoryMap.get(product?.category?.id);
    if (productCategory?.parent?.id === firstParent) return true;

    const firstItemCategory = categoryMap.get(compareItems[0].categoryId);
    if (firstItemCategory?.parent?.id === productParent) return true;

    return false;
  };

  const handleLoadMore = () => {
    if (!loading && hasMore) loadProducts();
  };

  const handleClose = () => {
    setSearchQuery("");
    setProducts([]);
    setPage(1);
    setHasMore(true);
    onClose();
  };

  return (
    <Dialog open={open} onClose={handleClose} maxWidth="lg" fullWidth>
      <DialogTitle>
        <Box display="flex" justifyContent="space-between" alignItems="center">
          <Typography variant="h6">Tìm kiếm sản phẩm để so sánh</Typography>
          <Typography variant="body2" color="text.secondary">
            Đã chọn: {compareItems.length}/4 sản phẩm
          </Typography>
        </Box>
        <Typography variant="body2" color="primary" sx={{ mt: 1 }}>
          💡 Chỉ hiển thị sản phẩm cùng loại với sản phẩm đã chọn
        </Typography>
      </DialogTitle>

      <DialogContent>
        <Box mb={2}>
          <TextField
            fullWidth
            placeholder="Tìm kiếm sản phẩm..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            sx={{ mb: 2 }}
          />
        </Box>

        <Grid container spacing={2}>
          {products.map((product) => {
            const inCompareList = isInCompareList(product.id);
            const canAdd = canAddToCompare(product);
            return (
              <Grid item xs={12} sm={6} md={4} key={product.id}>
                <Card sx={{ height: "100%", display: "flex", flexDirection: "column" }}>
                  <CardMedia
                    component="img"
                    height="200"
                    image={product.images?.[0]?.url || "/logo.png"}
                    alt={product.title}
                    sx={{ objectFit: "cover" }}
                  />
                  <CardContent sx={{ flexGrow: 1, display: "flex", flexDirection: "column" }}>
                    <Typography gutterBottom variant="h6" component="h2" noWrap>
                      {product.title}
                    </Typography>

                    <Typography variant="body2" color="text.secondary" sx={{ mb: 1 }}>
                      {product.category?.name} • {product.material}
                    </Typography>

                    <Typography variant="h6" color="primary" sx={{ mb: 2 }}>
                      {formatPrice(product.productSizes?.[0]?.discountPrice || 0)}
                    </Typography>

                    <Box sx={{ mt: "auto" }}>
                      {inCompareList ? (
                        <Button fullWidth disabled color="success">
                          Đã thêm
                        </Button>
                      ) : !canAdd ? (
                        <Button fullWidth disabled color="error">
                          Khác loại
                        </Button>
                      ) : (
                        <Button fullWidth variant="contained" onClick={() => handleAddToCompare(product)}>
                          Thêm so sánh
                        </Button>
                      )}
                    </Box>
                  </CardContent>
                </Card>
              </Grid>
            );
          })}
        </Grid>

        {loading && (
          <Box display="flex" justifyContent="center" mt={2}>
            <CircularProgress />
          </Box>
        )}

        {hasMore && !loading && products.length > 0 && (
          <Box display="flex" justifyContent="center" mt={2}>
            <Button variant="outlined" onClick={handleLoadMore}>
              Tải thêm
            </Button>
          </Box>
        )}

        {products.length === 0 && !loading && (
          <Box display="flex" justifyContent="center" mt={4}>
            <Typography color="text.secondary">Không tìm thấy sản phẩm nào</Typography>
          </Box>
        )}
      </DialogContent>

      <DialogActions>
        <Button onClick={handleClose}>Đóng</Button>
      </DialogActions>
    </Dialog>
  );
}
