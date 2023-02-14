const CartPageItem = (prop) => {
    return (
        <>
            <div>
                {prop.product.userId}
                {prop.product.productId}
                {prop.product.size}
                {prop.product.quantity}
            </div>
        </>
    )
}

export default CartPageItem