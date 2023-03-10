import { useEffect } from "react"
import { useSelector } from "react-redux"
import { fetchUserFavorite } from "../../store/favorite"
import { useDispatch } from "react-redux"
import ProductIndexItem from "../ProductIndexItem"
import "./FavoriteShowPage.css"
import { Redirect } from "react-router-dom"

const FavoriteShowPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const favorites = useSelector(state => state.favorites ? Object.values(state.favorites) : [])
    const length = favorites.length

    
    useEffect(() => {
        window.scrollTo(0, 0);
        dispatch(fetchUserFavorite(currentUser.id))
    }, [length])

    const ProductDiv = favorites.map(product => <ProductIndexItem key={product.productId} product={product} />)
    
    return !currentUser ? <Redirect to="/login"/> : (
        <>
            <div className="favorites-header">
                <h1>{`Favorites (${length})`}</h1>
            </div>
            <div className="index-product-div">
                {ProductDiv}
            </div>
        </>
    )
}

export default FavoriteShowPage