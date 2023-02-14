import { useDispatch } from "react-redux"
import { useSelector } from "react-redux"
import { useEffect, useState } from "react"
import { fetchUserCart } from "../../store/cart"
import CartPageItem from "../CartPageItem"
import { Redirect } from "react-router-dom"

const CartPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const cart = useSelector(state => state.cart ? Object.values(state.cart) : [])
    
    useEffect(() => {
        dispatch(fetchUserCart(currentUser.id))
    }, [currentUser.id])


    const cartInfo = cart.map((product,i) => <CartPageItem key={i} product={product}/>)
    const cartLength = cart.length
    
    return (
        <>
            <h1>{`Shopping Cart (${cartLength})`}</h1>
            {cartInfo}
        </>
    )
}
export default CartPage