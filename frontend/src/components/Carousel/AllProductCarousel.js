import React from "react";
import ProductIndexItem from "../ProductIndexItem";
import { Swiper, SwiperSlide } from "swiper/react";
import { Navigation, A11y } from "swiper";
import "swiper/css";

const AllProductCarousel = ({randomizeProducts}) => {

    return (
        <Swiper style={{ width: "100%", height: "100%"}}modules={[Navigation, A11y]} spaceBetween={0} slidesPerView={5}navigation >
            {randomizeProducts.map((product, i) => {
                return (
                    <SwiperSlide key={product.id}>
                        <ProductIndexItem key={i} product={product} />
                    </SwiperSlide>
                );
            })}
        </Swiper>
    );   
};

export default AllProductCarousel;