import { useLocation } from "react-router-dom";
import { useEffect } from "react";
import { getProducts } from "../../store/product";
import { useDispatch } from "react-redux";
import EachItem from "./EachItem";
import "./ConfirmationPage.css"

const ConfirmationPage = () => {
    const dispatch = useDispatch()
    const location = useLocation();
    const cart = location.state.cart;
    const confirmationNumber = Math.floor(Math.random() * 100000000);

    useEffect(() => {
        dispatch(getProducts())
        window.scrollTo(0, 0);
    }, [])

    const total = cart.reduce((acc, product) => (acc + (product.price * product.quantity)), 0).toLocaleString()
    const eachItem = cart.map(product => <EachItem key={product.id} product={product}/>)

    return (
        <>
            <div className="confirmation-wrapper">
                <div className="confirmation-header">
                    <h1>Thank You!  </h1>
                    <h2>Confirmation has been sent to your email address</h2>
                    <h2>{`Your order #${confirmationNumber}`}</h2>
                </div>

                <div className="confirmation-product-detail">
                    <p>Product</p>
                    <div className="c-inner-div">
                        <p>Quantity</p>
                        <p>Price</p>
                    </div>
                </div>
                <div>
                    {eachItem}
                </div>
                <div className="confirmation-total">
                    <h1>Total: ${total}</h1>
                </div>
            </div>

        </>
    )
}

export default ConfirmationPage