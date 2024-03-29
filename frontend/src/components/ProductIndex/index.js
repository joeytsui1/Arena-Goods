import { useDispatch, useSelector } from "react-redux"
import { useEffect } from "react"
import { getProducts } from "../../store/product"
import ProductIndexItem from "../ProductIndexItem"
import "./ProductIndex.css"
import { useState } from "react"

const ProductIndex = () => {
    const [loading, setIsLoading] = useState(true)
    const dispatch = useDispatch() 
    const products = useSelector(state => state.products ? Object.values(state.products) : [])

    useEffect(() => {
        window.scrollTo(0, 0);
        dispatch(getProducts("")).then(() => {
            const timeoutId = setTimeout(() => {
                setIsLoading(false)
            }, 500)})
    }, [])

    const productDiv = products.map(product => <ProductIndexItem key={product.id} product={product}/>)
    const result = productDiv.length
    return (
        <>
        {loading  ? <div className="loader"></div>: 
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
        }
        </>
    )
}

export default ProductIndex