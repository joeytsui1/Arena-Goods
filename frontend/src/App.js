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

function App() {
  return (
    <>
    <NavBar></NavBar>
    <Switch>
      <Route path="/login">
        <LoginFormPage />
      </Route>
      <Route exact path="/"><IndexPage/></Route>
      <Route path="/signup"><SignUpForm/></Route>
      <Route exact path="/products"><ProductIndex/></Route>
      <Route exact path="/products/:productId" component={ProductShowPage}/>
      <Route path="/brand" component={BrandShowPage}/>
    </Switch>
    <Footer></Footer>
    </>
  );
}

export default App;
