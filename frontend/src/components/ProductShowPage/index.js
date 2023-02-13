import { useSelector, useDispatch } from "react-redux"
import { useParams } from "react-router-dom"
import { useEffect } from "react"
import { getProduct, getProducts } from "../../store/product"
import AllProductCarousel from "../Carousel/AllProductCarousel"
import "./ProductShowPage.css"

const ProductShowPage = () => {
    const dispatch = useDispatch()
    const { productId } = useParams()

    const product = useSelector(state => state.products ? state.products[productId] : {})
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const sampleProducts = products ? products.slice(0, 10) : []
    useEffect(() => {
        dispatch(getProduct(productId))
        dispatch(getProducts())
    }, [dispatch, productId])

    if (product === undefined) {
        return <>Still loading...</>;
    }

    return (
        <>
        <div className="product-wrapper">
            <div className="product-div">
                <nav className="product-nav">
                    <a href="/">HOME</a>
                    <a href={`/brands/${product.brand.toLowerCase()}`}>{product.brand}</a>
                    <a className="shoe-name">{product.style} {product.name}</a>
                </nav>
                <img className="product-img" src={product.image} alt='product-img'></img>
                <p className="product-p">{product.description}</p>
            </div>
            <div className="test">
                <a href={`/brands/${product.brand.toLowerCase()}`}>{product.brand}</a>
                <h1>{product.style}</h1>
                <span>"{product.name}"</span>
                <span>${product.price}</span>
                <div className="checkout-box">
                    <p>US Men sizes displayed </p>
                    <button className="size-option">Select Size</button>
                    <button className="add-to-cart">ADD TO CART</button>
                </div>
            </div>
        </div>
        <div className="product-info-div">
            <div>
                <p>Manufactured SKU</p>
                <p>{product.sku}</p>
            </div>
            <div>
                <p>Gender</p>
                <p>{product.gender}</p>
            </div>
            <div>
                <p>Nickname</p>
                <p>{product.name}</p>
            </div>
            <div>
                <p>Release Date</p>
                <p>{product.releasedDate}</p>
            </div>
        </div>
        <div className="product-show-page-carousel">
            <p>You May Also Like</p>
            <AllProductCarousel sampleProducts={sampleProducts}/>
        </div>
        </>
    )
}

export default ProductShowPage