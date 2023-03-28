import { useSelector, useDispatch } from "react-redux"
import { Redirect, useParams } from "react-router-dom"
import { useEffect, useState } from "react"
import { getProduct, getProducts } from "../../store/product"
import AllProductCarousel from "../Carousel/AllProductCarousel"
import { makeCart } from "../../store/cart"
import { fetchUserCart } from "../../store/cart"
import { useHistory } from "react-router-dom"
import { fetchUserFavorite } from "../../store/favorite"
import "./ProductShowPage.css"

const ProductShowPage = () => {
    const [loading, setIsLoading] = useState(true)
    const dispatch = useDispatch()
    const history = useHistory()
    const { productId } = useParams()
    const [hide, setHide] = useState(true)
    const [size, setSize] = useState(null)

    const product = useSelector(state => state.products ? state.products[productId] : {})
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const currentUser = useSelector(state => state.session.user)
    const cart = useSelector(state => state.cart ? Object.values(state.cart) : [])
    const randomizeProducts = products ? products.sort(() => Math.random() - 0.5).slice(0, 10) : []

    useEffect(() => {
        window.scrollTo(0, 0);
        dispatch(getProduct(productId))
        dispatch(getProducts("")).then(() => {
            const timeoutId = setTimeout(() => {
                setIsLoading(false)
            }, 500) // wait for 3 seconds
            return () => clearTimeout(timeoutId) // cleanup function to clear the timeout when the component unmounts or when the effect runs again
        })
        currentUser ? dispatch(fetchUserFavorite(currentUser.id)) : dispatch(() => 1)
        currentUser ? dispatch(fetchUserCart(currentUser.id)) : dispatch(() => 1)
    }, [dispatch, productId, size, cart.length])

    const handleClick = (e) => {
        e.preventDefault()
        setHide(!hide)
    } 

    const redirectLogin = () => {
        history.push("/login")
    }

    const sizeClick = (e) => {
        e.preventDefault()
        setSize(e.target.value)
        setHide(!hide)
    }

    const addToCart = (e) => {
        const cart_item = {
            user_id: currentUser.id,
            product_id: product.id,
            size: size
        };
        dispatch(makeCart(cart_item));
    };

    if(!product) {
        return null
    }

    const text = size ? `US Size ${size}` : "Select A Size"
    return (
        <>
        {loading ? <div className="loader"></div>: 
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
                    <span>${product.price.toLocaleString()}</span>
                <div className="checkout-box">
                    <p>🇺🇸 US Men sizes displayed </p>
                        <button className="size-option" onClick={handleClick}>
                            {text}
                            <svg width="1em" height="1em" viewBox="0 0 8 4" class="css-155lj9h e1l7f7ih0"><path d="M0 0L8 0L4 4L0 0Z" fill="currentColor"></path></svg>
                        </button>
                    {hide ? null :
                    <>
                        <div className="inner-buttons-div">
                            <button className="size-inner-option" value={4} onClick={sizeClick}>Size 4</button>
                            <button className="size-inner-option" value={4.5} onClick={sizeClick}>Size 4.5</button>
                            <button className="size-inner-option" value={5} onClick={sizeClick}>Size 5</button>
                            <button className="size-inner-option" value={5.5} onClick={sizeClick}>Size 5.5</button>
                            <button className="size-inner-option" value={6} onClick={sizeClick}>Size 6</button>
                            <button className="size-inner-option" value={6.5} onClick={sizeClick}>Size 6.5</button>
                            <button className="size-inner-option" value={7} onClick={sizeClick}>Size 7</button>
                            <button className="size-inner-option" value={7.5} onClick={sizeClick}>Size 7.5</button> 
                            <button className="size-inner-option" value={8} onClick={sizeClick}>Size 8</button>
                            <button className="size-inner-option" value={8.5} onClick={sizeClick}>Size 8.5</button>
                            <button className="size-inner-option" value={9} onClick={sizeClick}>Size 9</button>
                            <button className="size-inner-option" value={9.5} onClick={sizeClick}>Size 9.5</button>
                            <button className="size-inner-option" value={10} onClick={sizeClick}>Size 10</button>
                            <button className="size-inner-option" value={10.5} onClick={sizeClick}>Size 10.5</button>
                            <button className="size-inner-option" value={11} onClick={sizeClick}>Size 11</button>
                            <button className="size-inner-option" value={11.5} onClick={sizeClick}>Size 11.5</button>
                            <button className="size-inner-option" value={12} onClick={sizeClick}>Size 12</button>
                        </div>
                    </>
                     }
                    <button onClick={currentUser ? addToCart : redirectLogin} className="add-to-cart" disabled={!size}>
                        ADD TO CART
                    </button>
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
            <AllProductCarousel randomizeProducts={randomizeProducts}/>
        </div>
        </>
        }
        </>
    )
}

export default ProductShowPage