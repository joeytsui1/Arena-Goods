import { useEffect } from "react"
import { useSelector } from "react-redux"
import { fetchUserFavorite } from "../../store/favorite"
import { useDispatch } from "react-redux"
import ProductIndexItem from "../ProductIndexItem"
import "./FavoriteShowPage.css"
import { Redirect } from "react-router-dom"
import { getProducts } from "../../store/product"
import AllProductCarousel from "../Carousel/AllProductCarousel"
import { useState } from "react"

const FavoriteShowPage = () => {
    const dispatch = useDispatch()
    const [loading, setIsLoading] = useState(true)
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const favorites = useSelector(state => state.favorites ? Object.values(state.favorites) : [])
    const length = favorites.length
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const randomizeProducts = products ? products.slice(0, 10) : []
    
    useEffect(() => {
        window.scrollTo(0, 0);
        dispatch(fetchUserFavorite(currentUser.id))
        dispatch(getProducts("")).then(() => {
            const timeoutId = setTimeout(() => {
                setIsLoading(false)
            }, 500) // wait for 3 seconds
            return () => clearTimeout(timeoutId) // cleanup function to clear the timeout when the component unmounts or when the effect runs again
        })
    }, [length])

    const ProductDiv = favorites.map(product => <ProductIndexItem key={product.productId} product={product} />)
    
    return !currentUser ? <Redirect to="/login"/> : (
        <>
        {loading ? <div className="loader"></div>: 
        <>
            <div className="favorites-header">
                <h1>{`Favorites (${length})`}</h1>
                {favorites.length === 0 ? <h2 className="empty-favorites">Your Favorites is Empty!</h2> : null}
            </div>
            <div className="index-product-div">
                {ProductDiv}
            </div>

            <div className="product-show-page-carousel">
                <p>You May Also Like</p>
                <AllProductCarousel randomizeProducts={randomizeProducts} />
            </div>
        </>
            }
        </>
    )
}

export default FavoriteShowPage