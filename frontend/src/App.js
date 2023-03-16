import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginForm';
import SignUpForm from './components/SignUpFormPage';
import NavBar from './components/NavBar';
import IndexPage from './components/IndexPage';
import ProductIndex from './components/ProductIndex';
import ProductShowPage from './components/ProductShowPage';
import Footer from './components/Footer';
import BrandShowPage from './components/BrandShowPage'
import ErrorPage from './components/ErrorPage';
import CartPage from './components/CartPage';
import FavoriteShowPage from './components/FavoriteShowPage';
import ConfirmationPage from './components/ConfirmationPage';
import SearchPage from './components/SearchPage';

function App() {
  return (
    <>
    <NavBar></NavBar>
    <Switch>
      
      <Route exact path="/signup"><SignUpForm/></Route>
      <Route exact path="/products"><ProductIndex /></Route>
      <Route path="/products/:productId" component={ProductShowPage} />
      <Route path="/brands/:brand" component={BrandShowPage} />
      <Route path="/search" component={SearchPage}/>
      <Route exact path="/"><IndexPage /></Route>
      <Route exact path="/cart"><CartPage/></Route>
      <Route path="/confirmation"><ConfirmationPage/></Route>
      <Route exact path="/favorites"><FavoriteShowPage/></Route>
      <Route exact path="/login"><LoginFormPage /></Route>
      <Route path="*" component={ErrorPage} />
      
    </Switch>
    <Footer></Footer>
    </>
  );
}

export default App;
