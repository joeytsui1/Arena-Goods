import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginForm';
import SignUpForm from './components/SignUpFormPage';
import NavBar from './components/NavBar';
import IndexPage from './components/IndexPage';
import Footer from './components/Footer';

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
    </Switch>
    <Footer></Footer>
    </>
  );
}

export default App;
