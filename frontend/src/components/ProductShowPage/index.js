import { useSelector, useDispatch } from "react-redux"
import { useParams } from "react-router-dom"
import { useEffect } from "react"
import { getProduct } from "../../store/product"
import { Redirect } from "react-router-dom"
import "./ProductShowPage.css"

const ProductShowPage = () => {
    const dispatch = useDispatch()
    const { productId } = useParams()

    const product = useSelector(state => state.products ? state.products[productId] : {})
    useEffect(() => {
        dispatch(getProduct(productId))

    }, [dispatch, productId])

    if (product === undefined) {
        return <>Still loading...</>;
    }



    return (
        <>
        <div className="product-wrapper">
            <div className="product-div">
                <nav className="product-nav">
                    <a href="/">Home</a>
                    <a href={`/brands/${product.brand.toLowerCase()}`}>{product.brand}</a>
                    <p>{product.style} {product.name}</p>
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
                    <button className="add-to-cart">Add to cart</button>
                </div>
            </div>
        </div>
        <div>
            <div>
                <p>Manufactured SKU</p>
                <p>{product.sku}</p>
            </div>
        </div>
        </>
    )
}

export default ProductShowPage