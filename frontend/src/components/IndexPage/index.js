import React, { useEffect } from "react"
import { useHistory } from "react-router-dom"
import { getProducts } from "../../store/product"
import { useDispatch, useSelector } from "react-redux"
import "./index.css"
import Carousel from "../Carousel/AllProductCarousel"
import AdidasCarousel from "../Carousel/AdidasCarousel"
import JordanCarousel from "../Carousel/JordanCarousel"
import NikeCarousel from "../Carousel/NikeCarousel"
import { fetchUserFavorite } from "../../store/favorite"


const IndexPage = () => {
    const history = useHistory()
    const dispatch = useDispatch()
    const products = useSelector(state => state.products ? Object.values(state.products) : [])

    useEffect(() => {
        dispatch(getProducts())
    }, [])

    const handleClick = (e) => {
        e.preventDefault()
        history.push("/brands/jordan")
    }
    
    const randomizeProducts = products ? products.sort(() => Math.random() - 0.5).slice(0, 10) : []
    const jordan = products.filter(product => product.brand.toLowerCase().includes("jordan"))
    const jordans = jordan ? jordan.slice(0, 10) : []
    const nike = products.filter(product => product.brand.toLowerCase().includes("nike"))
    const nikes = nike ? nike.slice(0, 10) : []
    const adidas = products.filter(product => product.brand.toLowerCase().includes("adidas"))
    const adidas2 = adidas ? adidas.slice(0, 10) : []
    return (
        <>
            <div className="home-div">
                <div className="home-background-pic-textbox">
                    <a className="home-textbox-link">AIR JORDAN</a>
                    <h1 className="home-textbox-header">Nothing Beats the Original</h1>
                    <p className="home-textbox-p">When it comes to Air Jordans, nothing beats the colorway Michael Jordan wore on his feets</p>
                    <button onClick={handleClick} className="home-textbox-button">Shop Now</button>
                </div>
                <img className="home-background-pic"  src="https://www.stadiumgoods.com/BWStaticContent/54000/b6f824e8-1118-42e3-993c-9e3686e5b449_20230206-ogjordans-desktop.jpg" alt="A description of the image" ></img>
            </div>
            <div>
                <div className="carousel-div">
                    <h1>All Shoes</h1>
                    <a href="/products">SHOP ALL SHOES</a>
                </div>
                <Carousel randomizeProducts={randomizeProducts}/>
            </div>

            <div>
                <div className="carousel-div">
                    <h1>Jordan</h1>
                    <a href="/brands/jordan">SHOP ALL JORDAN</a>
                </div>
                <JordanCarousel jordans={jordans} />
            </div>
            <div>
                <div className="carousel-div">
                    <h1>Nike</h1>
                    <a href="/brands/nike">SHOP ALL NIKE</a>
                </div>
                <NikeCarousel nikes={nikes} />
            </div>
            <div>
                <div className="carousel-div">
                    <h1>Adidas</h1>
                    <a href="/brands/adidas">SHOP ALL ADIDAS</a>
                </div>
                <AdidasCarousel adidas2={adidas2} />
            </div>
        </>

    )
}

export default IndexPage