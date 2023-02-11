import { useDispatch, useSelector } from "react-redux"
import { Redirect, useParams } from "react-router-dom"
import { useEffect } from "react"
import { getProducts } from "../../store/product"
import ProductIndexItem from "../ProductIndexItem"
import ErrorPage from "../ErrorPage"
import "./BrandShowPage.css"

const BrandShowPage = () => {
    const dispatch = useDispatch()
    const products = useSelector(state => state.products ? Object.values(state.products) : [])
    const { brand } = useParams()

    useEffect(() => {
        dispatch(getProducts())
    }, [])

    let image
    let brandInfo   
    let capitalizedBrand = brand[0].toUpperCase() + brand.slice(1).toLowerCase()

    if(brand === "jordan") {
        image = (<img className="brand-info-img" src="https://www.stadiumgoods.com/BWStaticContent/54000/7f295212-51a9-4db2-8ca0-38b1fe53bb2f_sg-plpheader-2000x680-jordan.jpg"/>)
        brandInfo = (<p className="brand-info-p">Take flight. As soon as the Air Jordan line debuted in 1985, it started shaping sneaker culture as we know it today. Find all the legendary models including the Air Jordan 1, Air Jordan 3, Air Jordan 6, and Air Jordan 11 here.</p>)
    } else if (brand === "adidas") {
        image = (<img className="brand-info-img" src="https://www.stadiumgoods.com/BWStaticContent/54000/ad45a6cf-38df-4685-a3f4-3eceb20f4173_sg-plpheader-2000x680-adidas.jpg" />)
        brandInfo = (<p className="brand-info-p">The "Brand with the 3 Stripes" is a legend, birthing classics from the Stan Smith to the Superstar before reinventing itself with NMD, Ultra Boost, and its Yeezy collection.</p>)
    } else if (brand === "new-balance") {
        image = (<img className="brand-info-img" src="https://www.stadiumgoods.com/BWStaticContent/54000/f972c813-66f8-4507-939c-e8209e475d7a_sg-plpheader-2000x680-newbalance.jpg" />)
        brandInfo = (<p className="brand-info-p">Known for premium quality and ultimate comfort, New Balance is one of the world’s premier athletic footwear brands. Find a full range of the New England-based brand’s retro runners, modern hits, and coveted collaborations here.</p>)
        capitalizedBrand = "New Balance"
    } else if (brand === "asics") {
        image = (<img className="brand-info-img" src="https://www.stadiumgoods.com/BWStaticContent/54000/4cbb8441-16d7-4695-8576-44539578eaf1_sg-plpheader-2000x680-asics.jpg" />)
        brandInfo = (<p className="brand-info-p">Retro classics like the Gel-Lyte III and much more.</p>)
    } else if (brand === "nike") {
        image = (<img className="brand-info-img" src="https://www.stadiumgoods.com/BWStaticContent/54000/5de05508-447b-4ad2-b1ec-f69e7458c74f_221028-giftguide2022-dunks-2-m-desktop.jpg" />)
        brandInfo = (<p className="brand-info-p">Take flight. As soon as the Air Jordan line debuted in 1985, it started shaping sneaker culture as we know it today. Find all the legendary models including the Air Jordan 1, Air Jordan 3, Air Jordan 6, and Air Jordan 11 here.</p>)
    } else {
        return (<Redirect to="/*" />)
    }

    const filtered = products.filter(product => product.brand.toLowerCase().includes(brand))
    const productDiv = filtered.map(product => <ProductIndexItem key={product.id} product={product} />)

    if (products === undefined) {
        return (
            <>still loading...</>
        )
    }

    return (
        <>
            <div className="brand-div">
                <div className="brand-inner-div">
                    <p>Shop</p>
                    <h1 className="brand-div-h1">{capitalizedBrand}</h1>
                    {brandInfo}
                </div>
                {image}
            </div>
            <div className="index-product-div">
                {productDiv}
            </div>
        </>
    )
}

export default BrandShowPage