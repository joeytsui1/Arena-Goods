import { useDispatch, useSelector } from "react-redux"
import { useEffect } from "react"
import { getProducts } from "../../store/product"
import ProductIndexItem from "../ProductIndexItem"
import "./ProductIndex.css"

const ProductIndex = () => {
    const dispatch = useDispatch() 
    const products = useSelector(state => state.products ? Object.values(state.products) : [])

    useEffect(() => {
        dispatch(getProducts())
    }, [])

    if(products === undefined) {
        return (
            <>Still Loading</>
        )
    }


    const productDiv = products.map(product => <ProductIndexItem key={product.id} product={product}/>)

    return (
        <>
            <div className="index-product-div">
                {productDiv}
            </div>
            
        </>
    )
}

export default ProductIndex