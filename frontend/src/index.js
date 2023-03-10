import React from 'react';
import ReactDOM from 'react-dom';
import './reset.css'
import App from './App';
import { Provider } from 'react-redux'
import { configureStore } from './store';
import './index.css';
import { BrowserRouter } from 'react-router-dom'
import csrfFetch, { restoreCSRF } from './store/csrf';
import * as sessionActions from './store/session'
import * as productActions from './store/product'
import * as cartActions from './store/cart'
import * as favoriteActions from './store/favorite'


const store = configureStore()

if (process.env.NODE_ENV !== 'production') {
  window.store = store
  window.csrfFetch = csrfFetch
  window.sessionActions = sessionActions
  window.productActions = productActions
  window.cartActions = cartActions
  window.favoriteActions = favoriteActions
}

function Root() {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>
  )
}

const renderApplication = () => {
  ReactDOM.render(
    <React.StrictMode>
      <Root />
    </React.StrictMode>,
    document.getElementById('root')
  );
}


if (sessionStorage.getItem("X-CSRF-Token") === null) {
  restoreCSRF().then(renderApplication);
} else {
  renderApplication();
}

