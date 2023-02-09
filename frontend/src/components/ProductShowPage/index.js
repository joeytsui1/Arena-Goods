import { useSelector, useDispatch } from "react-redux"
import { useParams } from "react-router-dom"
import { useEffect } from "react"
import { getProduct } from "../../store/product"
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
                    <a>Home</a>
                    <a>{product.brand}</a>
                    <p>{product.style} {product.name}</p>
                </nav>
                <img className="product-img" src={product.image} alt='product-img'></img>
                <p className="product-p">{product.description}</p>
            </div>
            <div className="test">
                <a href="#">{product.brand}</a>
                <h1>{product.style}</h1>
                <span>"{product.name}"</span>
                <span>$3410</span>
                <div className="checkout-box">
                    <h1>this is the size dropdown option</h1>
                    <h1>this is the button for choosing sizes and dropdown</h1>
                    <h1>this is the add to cart button</h1>
                </div>
            </div>
        </div>
        </>
    )
}

export default ProductShowPage