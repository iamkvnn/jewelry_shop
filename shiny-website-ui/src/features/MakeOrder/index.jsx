import { FormControl, Grid2, TextField } from '@mui/material';
import { useEffect, useRef, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import Button from '../../components/Button';
import DeliveryMethod from './components/DeliveryMethod';
import PaymentMethod from './components/PaymentMethod';
import ProductItem from './components/ProductItem';
import UserInfoForm from './components/UserInfoForm';
import './styles.css';
import paymentApi from '../../api/paymentApi';
import orderApi from '../../api/orderApi';
import voucherApi from '../../api/voucherApi';
import customerAddressApi from '../../api/customerAddressApi';
import { Autocomplete } from '@mui/material';
import userApi from '../../api/userApi';
import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

function MakeOrder() {
    const [checkoutItems, setCheckoutItems] = useState([]);
    const [addresses, setAddresses] = useState([]);
    const [userData, setUserData] = useState(null);
    const [shouldRedirect, setShouldRedirect] = useState(false);
    const [paymentMethod, setPaymentMethod] = useState('COD');
    const [momoQrUrl, setMomoQrUrl] = useState(null);
    const [isProcessing, setIsProcessing] = useState(false);
    const [orderId, setOrderId] = useState(null);
    const [deliveryMethod, setDeliveryMethod] = useState('standard');
    const [verifiedPromotionCode, setVerifiedPromotionCode] = useState('');
    const [verifiedFreeshipCode, setVerifiedFreeshipCode] = useState('');
    const [voucherVerified, setVoucherVerified] = useState(false);
    const [voucherOptions, setVoucherOptions] = useState([]);
    const [promotionInput, setPromotionInput] = useState('');
    const [freeshipInput, setFreeshipInput] = useState('');
    const [promotionDiscount, setPromotionDiscount] = useState(0);
    const [promotionDiscountFee, setPromotionDiscountFee] = useState(0);
    const [freeShipDiscount, setFreeShipDiscount] = useState(0);
    const [freeShipDiscountFee, setFreeShipDiscountFee] = useState(0);
    const [totalPrice, setTotalPrice] = useState(0);
    const [shippingFee, setShippingFee] = useState(0);
    const [selectedAddress, setSelectedAddress] = useState(null);
    const [applyLimitFreeShip, setApplyLimitFreeShip] = useState(0);
    const [applyLimitPromotion, setApplyLimitPromotion] = useState(0);
    const [subTotal, setSubTotal] = useState(0);

    const navigate = useNavigate();
    const formRef = useRef(null);

    // Calculate subtotal whenever checkoutItems changes
    const subtotal = checkoutItems.reduce((total, item) => {
        const price = item.productSize?.price || item.product?.price || 0;
        return total + price * (item.quantity || 1);
    }, 0);

    useEffect(() => {
        async function fetchUserData() {
            try {
                const res = await userApi.getInfo();
                console.log("Thông tin người dùng:", res.data);
                setUserData(res.data);
            } catch (error) {
                console.error("Lỗi khi lấy thông tin người dùng:", error);
            }
        }
        fetchUserData();
    }, []);

    useEffect(() => {
        const storedItems = localStorage.getItem('checkoutItems');
        if (storedItems) {
            const items = JSON.parse(storedItems);
            setCheckoutItems(items);
            // Update subTotal when checkoutItems changes
            const calculatedSubTotal = items.reduce((total, item) => {
                const price = item.productSize?.price || item.product?.price || 0;
                return total + price * (item.quantity || 1);
            }, 0);  
            setSubTotal(calculatedSubTotal);
        }
    }, []);

    useEffect(() => {
        if (shouldRedirect) {
            navigate(`/checkouts/thank-you/${orderId}`);
        }
    }, [shouldRedirect, navigate, orderId]);

    useEffect(() => {
        async function fetchAddresses() {
            try {
                const res = await customerAddressApi.getCustomerAddresses();
                setAddresses(res.data.content || []);
            } catch (e) {
                setAddresses([]);
            }
        }
        fetchAddresses();
    }, []);

    const handleVoucherFocus = async () => {
        try {
            const res = await voucherApi.getValidVouchers({ data: { totalProductPrice: subtotal }, page: 1, size: 30 });
            const vouchers = res.data?.content || [];
            console.log("Vouchers:", vouchers);
            setVoucherOptions(vouchers);
        } catch (error) {
            console.error("❌ Lỗi khi lấy voucher:", error);
        }
    };

    const fetchShippingFee = async (address, method) => {
        if (!address) {
            console.log("Chưa có địa chỉ, không thể lấy phí ship");
            setShippingFee(0);
            updateTotalPrice(0);
            return;
        }

        const shippingMethod = method.toUpperCase();

        try {
            const res = await orderApi.getEstimateShippingFee(address, shippingMethod);
            const newShippingFee = res.data?.fee || res.data || 0;

            setShippingFee(newShippingFee);
            updateTotalPrice(newShippingFee);
        } catch (error) {
            console.error("Lỗi khi lấy phí ship:", error);
            setShippingFee(0);
            updateTotalPrice(0);
        }
    };

    const updateTotalPrice = (newShippingFee) => {
        const discountedSubtotal = subtotal - promotionDiscountFee;
        const discountedShippingFee = newShippingFee - freeShipDiscountFee;
        const total = discountedSubtotal + discountedShippingFee;
        setTotalPrice(total);
    };

    const handleDeliveryMethodChange = (method) => {
        setDeliveryMethod(method);
    };

    const handleAddressChange = (address) => {
        console.log("Địa chỉ đã thay đổi:", address);
        setSelectedAddress(address);
    };

    useEffect(() => {
        if (selectedAddress && deliveryMethod) {
            fetchShippingFee(selectedAddress, deliveryMethod);
        }
    }, [selectedAddress, deliveryMethod]);

    const applyVoucher = async () => {
        try {
            const voucherCodes = [promotionInput, freeshipInput].filter(Boolean);
            const promoVoucher = voucherOptions.find(v => v.code === promotionInput) || null
            const freeShipVoucher = voucherOptions.find(v => v.code === freeshipInput) || null

            setPromotionDiscount(promoVoucher != null ? promoVoucher.discountRate : 0);
            setFreeShipDiscount(freeShipVoucher != null ? freeShipVoucher.discountRate : 0);
            setApplyLimitPromotion(promoVoucher != null ? promoVoucher.applyLimit : 0);
            setApplyLimitFreeShip(freeShipVoucher != null ? freeShipVoucher.applyLimit : 0);

            const promoDis = promoVoucher != null ? promoVoucher.discountRate : 0;
            const freeShipDis = freeShipVoucher != null ? freeShipVoucher.discountRate : 0;
            const promoLimit = promoVoucher != null ? promoVoucher.applyLimit : 0;
            const freeShipLimit = freeShipVoucher != null ? freeShipVoucher.applyLimit : 0;

            const cartItems = checkoutItems.map(item => ({
                product: item.product,
                productSize: { id: item.productSize?.id },
                quantity: item.quantity || 1
            }));

            const res = await voucherApi.validateVoucher({
                voucherCodes,
                totalProductPrice: subtotal,
                cartItems
            });

            if (res.code === '200') {
                setPromotionDiscountFee(
                    Math.min(subtotal * (promoDis / 100), promoLimit)
                );
                const promoValue = Math.min(subtotal * (promoDis / 100), promoLimit);
                setFreeShipDiscountFee(
                    Math.min(shippingFee * (freeShipDis / 100), freeShipLimit)
                );
                const freeshipValue = Math.min(shippingFee * (freeShipDis / 100), freeShipLimit);
                const discountedSubtotal = subtotal - promoValue;
                const discountedShippingFee = shippingFee - freeshipValue;
                const total = discountedSubtotal + discountedShippingFee;
                setVerifiedPromotionCode(promotionInput);
                setVerifiedFreeshipCode(freeshipInput);
                setVoucherVerified(true);
                setTotalPrice(total);
            } else {
                resetVoucherValues();
                toast.warning(res.message);
            }
        } catch (error) {
            console.error("❌ Lỗi khi áp dụng voucher:", error);
            resetVoucherValues();
            alert('Voucher không hợp lệ hoặc đã hết hạn.');
        }
    };

    const resetVoucherValues = () => {
        setPromotionDiscount(0);
        setFreeShipDiscount(0);
        setPromotionDiscountFee(0);
        setFreeShipDiscountFee(0);
        setTotalPrice(subtotal + shippingFee);
    };

    const handlePaymentMethodChange = (method) => {
        setPaymentMethod(method);
        setMomoQrUrl(null);
    };

    function validateCheckoutItems(items) {
        if (!items || items.length === 0) return false;
        return items.every(item => item.productSize?.id && item.quantity > 0);
    }

    function prepareCartItems(items) {
        return items.map(item => ({
            productSize: { id: item.productSize.id },
            quantity: item.quantity || 1
        }));
    }

    async function handleFormSubmit(value) {
        setIsProcessing(true);
        try {
            console.log("🛒 Bắt đầu xử lý đặt hàng...");
            if (!validateCheckoutItems(checkoutItems)) {
                console.error("❌ Giỏ hàng không hợp lệ");
                alert('Giỏ hàng không hợp lệ');
                setIsProcessing(false);
                return;
            }
            
            if (!selectedAddress) {
                toast.warning('Vui lòng chọn và xác nhận địa chỉ giao hàng');
                setIsProcessing(false);
                return;
            }

            const verifiedVoucherCodes = [];
            if (verifiedPromotionCode) verifiedVoucherCodes.push(verifiedPromotionCode);
            if (verifiedFreeshipCode) verifiedVoucherCodes.push(verifiedFreeshipCode);

            const orderRequest = {
                shippingAddress: { id: selectedAddress.id },
                shippingMethod: deliveryMethod.toUpperCase(),
                paymentMethod,
                cartItems: prepareCartItems(checkoutItems),
                totalProductPrice: subtotal,
                shippingFee: shippingFee,
                totalPrice,
                voucherCodes: voucherVerified ? verifiedVoucherCodes : [],
                freeShipDiscount: voucherVerified ? freeShipDiscountFee : 0,
                promotionDiscount: voucherVerified ? Math.round(promotionDiscountFee) : 0,
                note: value.note || "",
            };

            const orderResponse = await orderApi.placeOrder(orderRequest);
            const newOrderId = orderResponse?.data?.id;

            if (!newOrderId) {
                throw new Error('Không nhận được ID đơn hàng');
            }
            setOrderId(newOrderId);

            if (paymentMethod === 'MOMO') {
                try {
                    const { data } = await paymentApi.createMomoPayment(newOrderId);
                    if (!data || typeof data !== 'string' || !data.startsWith('http')) {
                        throw new Error("Không nhận được liên kết thanh toán hợp lệ");
                    }
                    window.location.href = data;
                } catch (error) {
                    console.error("❌ Lỗi thanh toán MoMo:", error);
                    alert("Lỗi thanh toán: " + error.message);
                }
            } else if (paymentMethod === 'VN_PAY') {
                try {
                    const { data } = await paymentApi.createVNpayPayment(newOrderId);
                    if (!data || typeof data !== 'string' || !data.startsWith('http')) {
                        throw new Error("Không nhận được liên kết thanh toán hợp lệ");
                    }
                    window.location.href = data;
                } catch (error) {
                    console.error("❌ Lỗi thanh toán VN_PAY:", error);
                    alert("Lỗi thanh toán: " + error.message);
                }
            } else {
                setShouldRedirect(true);
            }
        } catch (error) {
            console.error("❌ Lỗi khi đặt hàng:", error);
            alert(`Đã xảy ra lỗi: ${error.message}`);
        } finally {
            setIsProcessing(false);
        }
    }

    return (
        <>
            <ToastContainer
                position="top-right"
                autoClose={3000}
                hideProgressBar={false}
                newestOnTop
                closeOnClick
                rtl={false}
                pauseOnFocusLoss
                draggable
                pauseOnHover
                theme="light"
            />
            <Grid2 container spacing={3} sx={{ justifyContent: "center", backgroundColor: '#f9f9f9', mt: 4, mb: 4 }}>
                <Grid2 xs={11} sm={5}>
                    <div className="payment-info">
                        <div className="user-header">
                            <img 
                                src="https://icons.veryicon.com/png/o/miscellaneous/standard/avatar-15.png" 
                                alt="User Avatar" 
                                className="user-avatar" 
                            />
                            <div className="user-details">
                                {userData ? (
                                    <>
                                        <p className="user-name">{userData.fullName} ({userData.email})</p>
                                    </>
                                ) : (
                                    <p className="user-name">Đang tải...</p>
                                )}
                            </div>
                        </div>
                        <UserInfoForm
                            addresses={addresses}
                            onSubmit={handleFormSubmit}
                            onAddressChange={handleAddressChange}
                            ref={formRef}
                        />
                        <DeliveryMethod onChange={handleDeliveryMethodChange} />
                        <PaymentMethod onChange={handlePaymentMethodChange} />
                        {momoQrUrl && (
                            <div style={{ textAlign: 'center', margin: '20px 0' }}>
                                <h3>Quét mã QR MoMo để thanh toán</h3>
                                <img src={momoQrUrl} alt="Momo QR" style={{ maxWidth: 250 }} />
                            </div>
                        )}
                        <div className="payment-button">
                            <Link href="/cart" className="back-to-cart"> &lt; Giỏ Hàng</Link>
                            {!momoQrUrl && (
                                <Button 
                                    title='Hoàn Tất Đơn Hàng' 
                                    disabled={isProcessing} 
                                    onClick={() => {
                                        if (formRef.current) {
                                            formRef.current.dispatchEvent(
                                                new Event('submit', { bubbles: true, cancelable: true })
                                            );
                                        }
                                    }} 
                                />
                            )}
                        </div>
                    </div>
                </Grid2>
    
                <Grid2 xs={11} sm={4}>
                    <div className="checkout-info">
                        <div className="list-checkout">
                            {checkoutItems.length > 0 ? (
                                checkoutItems.map((item, index) => (
                                    <ProductItem
                                        key={item.id || index}
                                        product={item.product}
                                        quantity={item.quantity || 1}
                                        productSize={item.productSize}
                                    />
                                ))
                            ) : (
                                <>
                                    <ProductItem />
                                    <ProductItem />
                                </>
                            )}
                        </div>
                        <div className="discount-container">
                            <FormControl sx={{ flex: 1, marginRight: 1 }}>
                                <div style={{ display: 'flex', gap: 16 }}>
                                    <div style={{ flex: 1 }}>
                                        <Autocomplete
                                            freeSolo
                                            options={voucherOptions.filter(v => v.type === 'PROMOTION')}
                                            getOptionLabel={(option) => option.code || ''}
                                            onFocus={handleVoucherFocus}
                                            value={voucherOptions.find(v => v.code === promotionInput) || null}
                                            inputValue={promotionInput}
                                            onInputChange={(event, newInputValue) => setPromotionInput(newInputValue)}
                                            onChange={(event, newValue) => {
                                                if (newValue && newValue.code) {
                                                    setPromotionInput(newValue.code);
                                                } 
                                                else if (newValue) {
                                                    setPromotionInput(newValue);
                                                }
                                                else {
                                                    setPromotionInput('');
                                                }
                                            }}
                                            renderOption={(props, option, { index }) => (
                                                <li {...props} key={option.id || `promotion-${index}`}>
                                                    <div>
                                                        <strong>{option.code}</strong>
                                                        <div style={{ fontSize: 12, color: '#888' }}>
                                                            {option.discountRate ? `${option.discountRate}% khuyến mãi` : ''}
                                                        </div>
                                                    </div>
                                                </li>
                                            )}
                                            renderInput={(params) => (
                                                <TextField
                                                    {...params}
                                                    label="Mã khuyến mãi"
                                                    sx={{
                                                        '& .MuiInputBase-root': {
                                                            height: 47,
                                                        },
                                                    }}
                                                />
                                            )}
                                        />
                                    </div>
                                    <div style={{ flex: 1 }}>
                                        <Autocomplete
                                            freeSolo
                                            options={voucherOptions.filter(v => v.type === 'FREESHIP')}
                                            getOptionLabel={(option) => option.code || ''}
                                            onFocus={handleVoucherFocus}
                                            value={voucherOptions.find(v => v.code === freeshipInput) || null}
                                            inputValue={freeshipInput}
                                            onInputChange={(event, newInputValue) => setFreeshipInput(newInputValue)}
                                            onChange={(event, newValue) => {
                                                if (newValue && newValue.code) {
                                                    setFreeshipInput(newValue.code);
                                                } 
                                                else if (newValue) {
                                                    setFreeshipInput(newValue);
                                                }
                                                else {
                                                    setFreeshipInput('');
                                                }
                                            }}
                                            renderOption={(props, option, { index }) => (
                                                <li {...props} key={option.id || `freeship-${index}`}>
                                                    <div>
                                                        <strong>{option.code}</strong>
                                                        <div style={{ fontSize: 12, color: '#888' }}>
                                                            {option.discountRate ? `giảm ${option.discountRate}% phí vận chuyển` : ''}
                                                        </div>
                                                    </div>
                                                </li>
                                            )}
                                            renderInput={(params) => (
                                                <TextField
                                                    {...params}
                                                    label="Mã freeship"
                                                    sx={{
                                                        '& .MuiInputBase-root': {
                                                            height: 47,
                                                        },
                                                    }}
                                                />
                                            )}
                                        />
                                    </div>
                                </div>
                            </FormControl>
                            <Button
                                title="Sử dụng"
                                onClick={applyVoucher}
                                variant="contained"
                                sx={{ height: 47, minWidth: 100 }}
                            >
                                SỬ DỤNG
                            </Button>
                        </div>
                        <div className="line"></div>
                        <div className="estimate">
                            <span className="text">Tạm tính</span>
                            <span className="value">{subtotal.toLocaleString()}đ</span>
                        </div>
                        <div className="reduce">
                            <span className="text">Giảm giá đơn hàng</span>
                            <span className="value">{promotionDiscountFee.toLocaleString()}đ</span>
                        </div>
                        <div className="delivery-cost">
                            <span className="text">Giảm phí vận chuyển</span>
                            <span className="value">{freeShipDiscountFee.toLocaleString()}đ</span>
                        </div>
                        <div className="delivery-cost">
                            <span className="text">Phí vận chuyển</span>
                            <span className="value">{shippingFee.toLocaleString()}đ</span>
                        </div>
                        <div className="line"></div>
                        <div className="overall">
                            <span className="text total">Tổng cộng</span>
                            <span className="value total">{totalPrice.toLocaleString()}đ</span>
                        </div>
                    </div>
                </Grid2>
            </Grid2>
        </>
    );
}

export default MakeOrder;