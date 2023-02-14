import { useDispatch } from "react-redux"
import { useSelector } from "react-redux"
import { useEffect } from "react"
import { fetchCart } from "../../store/cart"
import CartPageItem from "../CartPageItem"

const CartPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session ? state.session.user : {})
    const cart = useSelector(state => state.cart ? Object.values(state.cart) : [])

    useEffect(() => {
        dispatch(fetchCart())
    }, [])

    if (cart === undefined) {
        return (<>Still loading...</>)
    }

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