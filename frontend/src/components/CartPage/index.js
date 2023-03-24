import { useDispatch } from "react-redux"
import { useSelector } from "react-redux"
import { useEffect, useState } from "react"
import { fetchUserCart } from "../../store/cart"
import { getProducts } from "../../store/product"
import { Redirect, useHistory } from "react-router-dom"
import CartPageItem from "../CartPageItem"
import AllProductCarousel from "../Carousel/AllProductCarousel"
import { fetchUserFavorite } from "../../store/favorite"
import { removeCart } from "../../store/cart"
import "./CartPage.css"

const CartPage = () => {
    const dispatch = useDispatch()
    const history = useHistory()
    const [isLoading, setIsLoading] = useState(true);
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const cart = useSelector(state => state.cart ? Object.values(state.cart) : null)
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const randomizeProducts = products ? products.sort(() => Math.random() - 0.5).slice(0, 10) : []
    const total = cart.reduce((acc, product) => acc += (product.price * product.quantity), 0).toLocaleString()
    
    useEffect(() => {
        dispatch(fetchUserCart(currentUser.id)).then(() => {
            const timeoutId = setTimeout(() => {
                setIsLoading(false)
            }, 2000) // wait for 3 seconds
            return () => clearTimeout(timeoutId) // cleanup function to clear the timeout when the component unmounts or when the effect runs again
        })
        dispatch(getProducts(""))
        dispatch(fetchUserFavorite(currentUser.id))
    }, [])

    const handleCheckout = async () => {
        try {
            for (const product of cart) {
                await dispatch(removeCart(product.id));
            }
            history.push({
                pathname: "/confirmation",
                state: { cart: cart }
            });
            window.location.reload()
        } catch (error) {
        }
    };

    const cartInfo = cart.map((product,i) => <CartPageItem key={i} product={product}/>)
    const cartLength = cart.length
    
    return !currentUser ? <Redirect to='/login'/> : (
        <>
            {isLoading ? <div className="loader"></div>: 
            <>
            <h1 className="checkout-header">{`Shopping Cart (${cartLength})`}</h1>
            {cartLength === 0 ? <h1 className="checkout-header2">Your Shopping is Empty!</h1> : null}
            <div className="checkout-wrapper">
                <div>
                    {cartInfo}
                </div>
                <div className="total-div">
                    <div className="total-info">
                        <h1>ORDER SUMMARY</h1>
                        <div>
                            <p>{`Subtotal:`}</p>
                            <p>${total}</p>
                        </div>
                        <div>
                            <p>Taxes:</p>
                            <p>$0</p>
                        </div>
                        <div className="total-price">
                            <p>{`Total:`}</p>
                            <p>${total}</p>
                        </div>
                        
                    </div>
                    <button onClick={handleCheckout} disabled={cart.length === 0 ? true : false} className="total-div-button">CHECKOUT</button>
                </div>
            </div>

            <div className="product-show-page-carousel">
                <p>You May Also Like</p>
                <AllProductCarousel randomizeProducts={randomizeProducts} />
            </div>
        </>
     }
     </>
    )
}
export default CartPage