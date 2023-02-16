import './ProductIndexItem.css'
import { useHistory } from 'react-router-dom'
import { BsHeart, BsHeartFill } from 'react-icons/bs'
import { makeFavorite, removeFavorite } from '../../store/favorite'
import { useDispatch } from 'react-redux'
import { useSelector } from 'react-redux'
import { useEffect, useState } from 'react'

const ProductIndexItem = (prop) => {

    const history = useHistory()
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session.user)
    const [hide, setHide] = useState(localStorage.getItem(`product_${prop.product.id}_hide`) === 'true' || true)

    const addFavoriteClick = (e) => {
        e.preventDefault()
        const product = {
            user_id: currentUser.id,
            product_id: prop.product.id
        }
        dispatch(makeFavorite(product))
        setHide(false)
        localStorage.setItem(`product_${prop.product.id}_hide`, true)
        
    }

    const removeFavoriteClick = (e) => {
        e.preventDefault()
        dispatch(removeFavorite(prop.product.id))
        setHide(true)
        localStorage.setItem(`product_${prop.product.id}_hide`, false)
        window.location.reload()
    }

    const redirectLogin = () => {
        history.push("/login")
    }

    const heartIcon = () => {
        return (
            <BsHeart style={{ marginTop: "30px", width: "100%" }} onClick={currentUser ? addFavoriteClick : redirectLogin} />
        )
    }
    const fillHeartIcon = () => {
        return (
            <BsHeartFill style={{ marginTop: "30px", width: "100%" }} onClick={currentUser ? removeFavoriteClick : redirectLogin} />
        )
    }

    const handleClick = () => {
        history.push(`/products/${prop.product.id}`)
    }

    return (
        <>
            <div >
                <div className="fix-this-shit">
                    {localStorage.getItem(`product_${prop.product.id}_hide`) === "true" ? fillHeartIcon() : heartIcon()}
                </div>
                <div className="each-product-item" onClick={handleClick}>
                    <img className="each-product-img" src={prop.product.image} />
                    <p className='each-product-brand'>{prop.product.brand}</p>
                    <p>{prop.product.style}</p>
                    <p>"{prop.product.name}"</p>
                    <p>${prop.product.price}</p>
                </div>
            </div>
        </>
    )
}

export default ProductIndexItem