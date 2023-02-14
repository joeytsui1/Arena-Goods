import "./CartPageItem.css"
import { useDispatch } from "react-redux"
import { removeCart } from "../../store/cart"
const CartPageItem = (prop) => {
    const dispatch = useDispatch()
    
    const deleteOnClick = (e) => {
        e.preventDefault()
        dispatch(removeCart(prop.product.id))
        window.location.reload()
    }
    return (
        <>
            <div>
                <p>Style: {prop.product.style}</p>
                <p>Name: {prop.product.name}</p>
                <p>Size: {prop.product.size}</p>
                <p>Quantity: {prop.product.quantity}</p>
                <img className="cart-image" src={prop.product.image}/>
                <a href="#" onClick={deleteOnClick}>Delete</a>
            </div>
        </>
    )
}

export default CartPageItem