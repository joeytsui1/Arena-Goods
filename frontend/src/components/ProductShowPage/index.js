import { useSelector, useDispatch } from "react-redux"
import { Redirect, useParams } from "react-router-dom"
import { useEffect, useState } from "react"
import { getProduct, getProducts } from "../../store/product"
import AllProductCarousel from "../Carousel/AllProductCarousel"
import { makeCart } from "../../store/cart"
import { fetchUserCart } from "../../store/cart"
import { useHistory } from "react-router-dom"
import "./ProductShowPage.css"

const ProductShowPage = () => {
    const dispatch = useDispatch()
    const history = useHistory()
    const { productId } = useParams()
    const [hide, setHide] = useState(true)

    const product = useSelector(state => state.products ? state.products[productId] : {})
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const currentUser = useSelector(state => state.session.user)
    const cart = useSelector(state => state.cart ? Object.values(state.cart) : [])
    const sampleProducts = products ? products.slice(0, 10) : []

    useEffect(() => {
        dispatch(getProduct(productId))
        dispatch(getProducts())
        currentUser ? dispatch(fetchUserCart(currentUser.id)) : dispatch(() => 1)
    }, [dispatch, productId, cart.length])

    if (product === undefined) {
        return <>Still loading...</>;
    }

    const handleClick = (e) => {
        e.preventDefault()
        setHide(!hide)
    } 

    const redirectLogin = () => {
        history.push("/login")
    }

    const addToCart = (e) => {
        const cart_item = {
            user_id: currentUser.id,
            product_id: product.id,
            size: 8.5
        }
        dispatch(makeCart(cart_item))
        // window.location.reload()
    }

    return (
        <>
        <div className="product-wrapper">
            <div className="product-div">
                <nav className="product-nav">
                    <a href="/">ARENA GOODS</a>
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
                    <button className="size-option" onClick={handleClick}>Select Size</button>
                    {hide ? null : 
                    <div>is open</div> }
                    <button onClick={currentUser ? addToCart : redirectLogin}className="add-to-cart">ADD TO CART</button>
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