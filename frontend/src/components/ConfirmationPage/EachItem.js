import "./ConfirmationPage.css"
const EachItem = ({product}) => {
    return (
        <>
        <div className="confirmation-product-wrapper">
            <div className="confirmation-product">
                <img className="confirmation-image" src={product.image}></img>
                <div>
                    <p>{product.brand}</p>
                    <p>{product.style}</p>
                    <p>{product.name}</p>
                    <p>Size: {product.size}</p>
                </div>
            </div>

            <div className="c-inner-div2">
                <p>{product.quantity}</p>
                    <p>${product.price.toLocaleString()}</p>
            </div>
        </div>

        </>
    )
}

export default EachItem