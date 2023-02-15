import "./CartPageItem.css"
import { useDispatch } from "react-redux"
import { removeCart, patchCart } from "../../store/cart"
const CartPageItem = (prop) => {
    const dispatch = useDispatch()
    
    const deleteOnClick = (e) => {
        e.preventDefault()
        dispatch(removeCart(prop.product.id))
        window.location.reload()
    }

    const updateOnClick = (e) => {
        e.preventDefault()
        const updated = {
            ...prop.product,
            size: 9
        }
        dispatch(patchCart(updated))
        window.location.reload()
    }
    return (
        <>
            <div className="cart-item-div">
                <img className="cart-image" src={prop.product.image} />
                <div className="cart-item-info">
                    <div className="cart-price-style">
                        <p>{prop.product.style}</p>
                        <p>${prop.product.price}</p>
                    </div>
                    <p>{prop.product.name}</p>
                    <p>Size: {prop.product.size}</p>
                    <p>Quantity: {prop.product.quantity}</p>
                    <div>
                        <a href="#" className="cart-crud-action" onClick={deleteOnClick}>Delete</a>
                        <span><a href="#" className="cart-crud-action" onClick={updateOnClick}>Update</a></span>
                    </div>
                </div>
            </div>
        </>
    )
}

export default CartPageItem