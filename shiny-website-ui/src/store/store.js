import { configureStore } from "@reduxjs/toolkit";
import userReducer from "../features/LoginSignin/store/authSlice";
import emailReducer from "../features/LoginSignin/store/emailSlice";
import compareReducer from "../features/Compare/compareSlice";

const store = configureStore({
  reducer: {
    user: userReducer,
    email: emailReducer,
    compare: compareReducer,
  },
});

export default store;
