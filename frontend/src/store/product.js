import csrfFetch from "./csrf";

const RECEIVE_PRODUCT = "products/receiveProduct"

const receiveProduct = (product) => ({
    type: RECEIVE_PRODUCT,
    product
})

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
        default:
            return state
    }
}

export default productsReducer