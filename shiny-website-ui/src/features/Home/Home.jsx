import Slider from './Slider/Slider';
import Category from './Category/Category';
import AlbumSlider from './AlbumSlider/AlbumSlider';
import IntroProduct from './IntroProduct/IntroProduct';
import GiftGuide from './GiftGuide/GiftGuide';
import Collection from './Collection/Collection';
import Newsletter from './Newsletter/Newsletter';
import './Home.css';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { clearCompare } from '../Compare/compareSlice';

const Home = () => {
    const dispatch = useDispatch();

    // Xóa dữ liệu compare khi vào trang home
    useEffect(() => {
        dispatch(clearCompare());
    }, [dispatch]);

    return (
        <div>
            <Slider />
            <Category />
            <AlbumSlider />
            <IntroProduct />
            <GiftGuide />
            <Collection />
            <Newsletter />
        </div>
    );
};

export default Home;