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
            <div className="cart-item-div">
                <img className="cart-image" src={prop.product.image} />
                <div className="cart-item-info">
                    <p>{prop.product.style}</p>
                    <p>{prop.product.name}</p>
                    <p>Price: ${prop.product.price}</p>
                    <p>Size: {prop.product.size}</p>
                    <p>Quantity: {prop.product.quantity}</p>
                    <a href="#" onClick={deleteOnClick}>Delete</a>
                </div>
            </div>
        </>
    )
}

export default CartPageItem