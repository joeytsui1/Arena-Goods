import csrfFetch from "./csrf";

const RECEIVE_PRODUCT = "products/receiveProduct"
const RECEIVE_PRODUCTS = "products/receiveProducts"

const receiveProduct = (product) => ({
    type: RECEIVE_PRODUCT,
    product
})

const receiveProducts = (products) => ({
    type: RECEIVE_PRODUCTS,
    products
})

export const getProducts = () => async dispatch => {
    const res = await csrfFetch("/api/products")
    const data = await res.json()
    dispatch(receiveProducts(data))
}

export const getProduct = (productId) => async dispatch => {
    const res = await csrfFetch(`/api/products/${productId}`)

    const data = await res.json()
    dispatch(receiveProduct(data))
    return data    
}

const productsReducer = (state={}, action) => {
    const newState = { ...state }

    switch(action.type) {
        case RECEIVE_PRODUCT:
            newState[action.product.id] = action.product
            return newState
        case RECEIVE_PRODUCTS:
            return { ...state, ...action.products }
        default:
            return state
    }
}

export default productsReducer