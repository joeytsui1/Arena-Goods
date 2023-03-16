import { useEffect } from "react";
import { useSelector } from "react-redux";
import ProductIndexItem from "../ProductIndexItem";

const SearchPage = () => {
    const products = useSelector(state => state.products ? Object.values(state.products) : [])

    useEffect(() => {
        window.scrollTo(0, 0);
    }, [])

    const productDiv = products.map(product => <ProductIndexItem key={product.id} product={product}/>)
    const result = productDiv.length
    return (
        <>
            <div className="brand-div">
                <div className="brand-inner-div">
                    <h1 className="brand-div-h1">Arena Goods</h1>
                    <p>Find all your favorites at Stadium Goods. Shop the latest and greatest releases from Nike, Jordan, Adidas, Converse, Vans, and much more.</p>
                </div>
                <img className="brand-info-img" src='https://www.stadiumgoods.com/BWStaticContent/54000/8fa05938-1b3f-499d-a262-b1c5d6f3888b_sg-plpheader-2000x680-update.jpg' />
            </div>
            <div className="result"><h1>Results ({result})</h1></div>
            <div className="index-product-div">
                {productDiv}
            </div>
            
        </>
    )
}

export default SearchPage