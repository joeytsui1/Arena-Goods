import { createStore, combineReducers, applyMiddleware, compose } from 'redux'
import thunk from 'redux-thunk'
import session from "./session"
import productsReducer from './product'
import cartReducer from './cart'
import favoriteReducer from './favorite'

const rootReducer = combineReducers({
    session,
    products: productsReducer,
    cart: cartReducer,
    favorites: favoriteReducer 
})

let enhancer;

if (process.env.NODE_ENV === 'production') {
    enhancer = applyMiddleware(thunk)
} else {
    const logger = require('redux-logger').default
    const composeEnhancers =
        window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
    enhancer = composeEnhancers(applyMiddleware(thunk, logger))
}

export const configureStore = preloadedState => {
    return createStore(rootReducer, preloadedState, enhancer)
}