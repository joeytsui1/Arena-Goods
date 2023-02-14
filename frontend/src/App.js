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

function App() {
  return (
    <>
    <NavBar></NavBar>
    <Switch>
      <Route path="/login"><LoginFormPage /></Route>
      <Route path="/signup"><SignUpForm/></Route>
      <Route exact path="/products"><ProductIndex /></Route>
      <Route path="/products/:productId" component={ProductShowPage} />
      <Route path="/brands/:brand" component={BrandShowPage} />
      <Route exact path="/"><IndexPage /></Route>
      <Route path="/cart"><CartPage/></Route>
      <Route path="*" component={ErrorPage} />

    </Switch>
    <Footer></Footer>
    </>
  );
}

export default App;
