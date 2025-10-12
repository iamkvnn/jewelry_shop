import { createSlice } from "@reduxjs/toolkit";

const STORAGE_KEY = "compare_list";

function loadInitialState() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed : [];
  } catch (_) {
    return [];
  }
}

function persist(state) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
  } catch (_) {
    // ignore
  }
}

// Each item: { id, title, image, categoryId, material, productSizes }
const initialState = {
  items: loadInitialState(),
};

const compareSlice = createSlice({
  name: "compare",
  initialState,
  reducers: {
    addToCompare(state, action) {
      const product = action.payload;
      const exists = state.items.some((p) => p.id === product.id);
      if (exists) return;
      if (state.items.length === 0) {
        state.items.push(product);
      } else {
        // Kiểm tra cùng parent category
        const firstItemCategoryId = state.items[0].categoryId;
        const productCategoryId = product.categoryId;
        
        // Logic kiểm tra parent category sẽ được xử lý ở component
        if (state.items.length >= 4) {
          // keep max 4 items
          state.items.shift();
        }
        state.items.push(product);
      }
      persist(state.items);
    },
    removeFromCompare(state, action) {
      const id = action.payload;
      state.items = state.items.filter((p) => p.id !== id);
      persist(state.items);
    },
    clearCompare(state) {
      state.items = [];
      persist(state.items);
    },
  },
});

export const { addToCompare, removeFromCompare, clearCompare } = compareSlice.actions;
export default compareSlice.reducer;


