import "./CartPageItem.css"
import { useEffect,useState } from "react"
import { useDispatch } from "react-redux"
import { removeCart, patchCart } from "../../store/cart"
import Modal from "../Modal"

const CartPageItem = (prop) => {
    const dispatch = useDispatch()
    const [show, setShow] = useState(false)
    console.log(prop)
    useEffect(() => {
        if (show) {
            document.body.classList.add('modal-open');
        } else {
            document.body.classList.remove('modal-open');
        }

    }, [show    ])
    
    const deleteOnClick = (e) => {
        e.preventDefault()
        dispatch(removeCart(prop.product.id))
        window.location.reload()
    }

    const showModal = (e) => {
        e.preventDefault()
        setShow(!show)
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
                        <span><a href="#" className="cart-crud-action" onClick={showModal}>Update</a></span>
                        <Modal product={prop.product} onClose={() => setShow(false)} show={show} />
                    </div>
                </div>
            </div>
        </>
    )
}

export default CartPageItem