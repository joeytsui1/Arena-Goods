import csrfFetch from "./csrf";

const RECEIVE_FAVORITE = "favorite/receiveFavorite"
const ADD_TO_FAVORITE = "favorite/addToFavorite"
const DELETE_FAVORITE = "favorite/deleteFavorite"

const getFavorite = favorite => ({
    type: RECEIVE_FAVORITE,
    favorite
})

const addToFavorite = product => ({
    type: ADD_TO_FAVORITE,
    product
})

const deleteFavorite = favoriteId => ({
    type: DELETE_FAVORITE,
    favoriteId
})

export const fetchUserFavorite = userId => async dispatch => {
    const res = await csrfFetch(`/api/favorites/${userId}`)
    const data = await res.json()
    dispatch(getFavorite(data))
    return data
}

export const makeFavorite = (favorite) => async dispatch => {
    const {user_id, product_id} = favorite
    const res = await csrfFetch('/api/favorites', {
        method: "POST",
        body: JSON.stringify({user_id, product_id})
    })
    const data = await res.json()
    dispatch(addToFavorite(data))
    return data
}

export const removeFavorite = favoriteId => async dispatch => {
    await csrfFetch(`/api/favorites/${favoriteId}`, {
        method: "DELETE"
    })
    dispatch(deleteFavorite(favoriteId))

}

const favoriteReducer = (state = {}, action) => {
    const newState = {...state}

    switch(action.type) {
        case RECEIVE_FAVORITE:
            return {...state, ...action.favorite}
        case ADD_TO_FAVORITE:
            return { ...state, ...action.product}
        case DELETE_FAVORITE:
            delete newState[action.favoriteId]
            return newState
        default:
            return state
    }
}

export default favoriteReducer