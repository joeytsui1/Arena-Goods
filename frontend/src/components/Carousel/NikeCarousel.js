import React from "react";
import ProductIndexItem from "../ProductIndexItem";
import { Swiper, SwiperSlide } from "swiper/react";
import { Navigation, A11y } from "swiper";
import "swiper/css";
import "swiper/css/navigation";


const NikeCarousel = ({nikes}) => {
    return (

        <Swiper
            style={{ width: "100%", height: "100%" }}
            modules={[Navigation, A11y]}
            spaceBetween={0}
            slidesPerView={5}
            navigation
        >
            {nikes.map((product, i) => {
                return (
                    <SwiperSlide key={product.id}>
                        <ProductIndexItem key={i} product={product} />
                    </SwiperSlide>
                );
            })}
        </Swiper>
    );
};

export default NikeCarousel;