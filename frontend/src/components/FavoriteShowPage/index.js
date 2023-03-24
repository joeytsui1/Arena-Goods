import { useEffect } from "react"
import { useSelector } from "react-redux"
import { fetchUserFavorite } from "../../store/favorite"
import { useDispatch } from "react-redux"
import ProductIndexItem from "../ProductIndexItem"
import "./FavoriteShowPage.css"
import { Redirect } from "react-router-dom"
import { getProducts } from "../../store/product"
import AllProductCarousel from "../Carousel/AllProductCarousel"

const FavoriteShowPage = () => {
    const dispatch = useDispatch()
    const currentUser = useSelector(state => state.session ? state.session.user : null)
    const favorites = useSelector(state => state.favorites ? Object.values(state.favorites) : [])
    const length = favorites.length
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const randomizeProducts = products ? products.slice(0, 10) : []
    
    useEffect(() => {
        window.scrollTo(0, 0);
        dispatch(fetchUserFavorite(currentUser.id))
        dispatch(getProducts(""))
    }, [length])

    const ProductDiv = favorites.map(product => <ProductIndexItem key={product.productId} product={product} />)
    
    return !currentUser ? <Redirect to="/login"/> : (
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
    )
}

export default FavoriteShowPage