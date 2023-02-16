import { useState, useEffect } from "react"
import { useSelector } from "react-redux"
import { fetchUserFavorite } from "../../store/favorite"
import { useDispatch } from "react-redux"

const FavoriteShowPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const favorites = useSelector(state => state.favorites ? Object.values(state.favorites) : [])
    console.log(favorites)
    useEffect(() => {
        dispatch(fetchUserFavorite(currentUser.id))
    }, [currentUser.id])

    return (
        <>
            {favorites.map(favorite => {
                return (<h1>{favorite.brand}</h1>,
                <h1>{favorite.style}</h1>,
                <h1>{favorite.name}</h1>)
            })}
        </>
    )
}

export default FavoriteShowPage