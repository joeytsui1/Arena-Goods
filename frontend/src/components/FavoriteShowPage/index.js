import { useState, useEffect } from "react"
import { useSelector } from "react-redux"
import { fetchUserFavorite } from "../../store/favorite"
import { useDispatch } from "react-redux"
import ProductIndexItem from "../ProductIndexItem"
import "./FavoriteShowPage.css"

const FavoriteShowPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const favorites = useSelector(state => state.favorites ? Object.values(state.favorites) : [])
    const length = favorites.length
    useEffect(() => {
        dispatch(fetchUserFavorite(currentUser.id))
    }, [currentUser.id, length])

    const ProductDiv = favorites.map(product => <ProductIndexItem key={product.productId} product={product} />)
    
    return (
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