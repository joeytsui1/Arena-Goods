import './ProductIndexItem.css'
import { useHistory } from 'react-router-dom'
const ProductIndexItem = (prop) => {
    const history = useHistory()
    const handleClick = () => {
        history.push(`/products/${prop.product.id}`)
    }

    return(
        <>
            <div onClick={handleClick} className="each-product-item">
                <img className="each-product-img" src={prop.product.image}/>
                <p className='each-product-brand'>{prop.product.brand}</p>
                <p>{prop.product.style}</p>
                <p>"{prop.product.name}"</p>
                <p>${prop.product.price}</p>
            </div>
        </>
    )
}

export default ProductIndexItem