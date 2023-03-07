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
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const cart = useSelector(state => state.cart ? Object.values(state.cart) : [])
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const randomizeProducts = products ? products.sort(() => Math.random() - 0.5).slice(0, 10) : []


    const total = cart.reduce((acc, product) => acc += (product.price * product.quantity), 0).toLocaleString()

    useEffect(() => {
        dispatch(fetchUserCart(currentUser.id))
        dispatch(getProducts())
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
            <h1 className="checkout-header">{`Shopping Cart (${cartLength})`}</h1>
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
                    <button onClick={handleCheckout} className="total-div-button">CHECKOUT</button>
                </div>
            </div>

            <div className="product-show-page-carousel">
                <p>You May Also Like</p>
                <AllProductCarousel randomizeProducts={randomizeProducts} />
            </div>

        </>
    )
}
export default CartPage