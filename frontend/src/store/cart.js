import csrfFetch from "./csrf";

const RECEIVE_ALL_CART = "cart/recieveAllCart"
const RECEIVE_CART = "cart/receiveCart"
const ADD_TO_CART = "cart/createCart"
const UPDATE_CART = "cart/updateCart"
const DELETE_CART = "cart/deleteCart"

const getAllCart = carts => ({
    type: RECEIVE_ALL_CART,
    carts
})

const getCart = cart => ({
    type: RECEIVE_CART,
    cart
})

const addToCart = product => ({
    type: ADD_TO_CART,
    product
})

const updateCart = product => ({
    type: UPDATE_CART,
    product
})

const deleteCart = cartId => ({
    type: DELETE_CART,
    cartId
})


export const fetchCart = () => async dispatch => {
    const res = await csrfFetch('/api/carts')
    const data = await res.json()
    dispatch(getAllCart(data))
    return data
}

export const makeCart = (cart) => async dispatch => {
    const {user_id, product_id, quantity, size} = cart
    const res = await csrfFetch('/api/carts', {
        method: "POST",
        body: JSON.stringify({ user_id, product_id, quantity, size })
    })
    const data = await res.json()
    dispatch(addToCart(data))
    return data
}

export const fetchUserCart = (userId) => async dispatch => {
    const res = await csrfFetch(`/api/carts/${userId}`)
    const data = await res.json()
    dispatch(getCart(data))
    return data
}

export const patchCart = (cart) => async dispatch => {
    const { userId, productId, quantity, size } = cart
    const res = await csrfFetch(`/api/carts/${cart.id}`, {
        method: "PATCH",
        body: JSON.stringify({ userId, productId, quantity, size })
    })

    const data = await res.json()
    dispatch(updateCart(data))
    return data
}

export const removeCart = (cartId) => async dispatch => {
    await csrfFetch(`/api/carts/${cartId}`, {
        method: "DELETE"
    })
    dispatch(deleteCart(cartId))
}

const cartReducer = (state = {}, action) => {
    const newState = { ...state }

    switch (action.type) {
        case RECEIVE_ALL_CART:
            const carts = Array.isArray(action.carts) ? action.carts : [action.carts];
            const newCartState = carts.reduce((cartObj, cart) => {
                return { ...cartObj, [cart.id]: cart }
            }, {})
            return { ...state, ...newCartState }
        case RECEIVE_CART:
            return {...action.cart}
        case ADD_TO_CART:
            newState[action.product.id] = Object.assign({}, action.product)
            return newState
        case UPDATE_CART:
            newState[action.product.id] = Object.assign({}, action.product)
            return newState
        case DELETE_CART:
            delete newState[action.cartId]
            return newState
        default:
            return state
    }
}

export default cartReducer