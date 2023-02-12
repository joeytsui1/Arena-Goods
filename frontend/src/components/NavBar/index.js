import { useDispatch, useSelector } from "react-redux";
import { logout } from "../../store/session";
import { useHistory } from "react-router-dom";
import logoImage from './images/logo.jpg'
import "./NavBar.css"

const NavBar = () => {
    const dispatch = useDispatch()
    const history = useHistory()
    const currentUser = useSelector(state => state.session.user)

    const handleClick = (e) => {
        e.preventDefault(); 
        dispatch(logout());
    }

    const redirectLogin = () => {
        history.push("/login")
    }

    const redirectHome = () => {
        history.push("/")
    }

    const logoutButton = (
        <button onClick={handleClick}>Sign out</button>
    )

    const loginButton = (
        <svg className="nav-login-button" onClick={currentUser ? handleClick : redirectLogin}>
            <path d="M18.975 18.8699C18.975 16.7411 18.3443 14.0867 13.456 12.2733C12.6938 12.0105 12.1945 11.2746 12.1945 10.4862V9.5138C13.1406 8.72536 13.6925 7.54271 13.6925 6.30749V4.20499C13.6925 1.89225 11.8003 0 9.48752 0C7.17477 0 5.28252 1.89225 5.28252 4.20499V6.30749C5.28252 7.54271 5.83443 8.72536 6.78055 9.5138V10.5125C6.78055 11.3009 6.28121 12.0105 5.51905 12.2996C2.9435 13.2457 0 14.8489 0 18.8962C0 19.5007 0.499343 20 1.10381 20H17.8449C18.502 19.9737 18.975 19.4744 18.975 18.8699ZM1.10381 18.8699C1.10381 16.1629 2.49672 14.5335 5.93955 13.272C7.09593 12.8515 7.88436 11.7214 7.88436 10.5125V9.01445L7.67411 8.85677C6.83312 8.2523 6.36005 7.30618 6.36005 6.30749V4.20499C6.36005 2.47043 7.77924 1.05125 9.5138 1.05125C11.2484 1.05125 12.6675 2.47043 12.6675 4.20499V6.30749C12.6675 7.30618 12.1945 8.2523 11.3798 8.85677L11.1695 9.01445V10.5125C11.1695 11.7477 11.958 12.8515 13.1143 13.272C16.5309 14.5335 17.9501 16.1629 17.9501 18.8699C17.9501 18.8962 17.9238 18.9225 17.8975 18.9225H1.13009C1.10381 18.9225 1.10381 18.8962 1.10381 18.8699Z" fill="currentColor"></path>
        </svg>

    )

    const cartButton = (

        <svg className="nav-cart-button">
            <path d="M16 6.5H13.5V5C13.5 2.243 11.257 0 8.5 0C5.743 0 3.5 2.243 3.5 5V6.5H1C0.724 6.5 0.5 6.724 0.5 7V19.5C0.5 19.776 0.724 20 1 20H16C16.276 20 16.5 19.776 16.5 19.5V7C16.5 6.724 16.276 6.5 16 6.5ZM4.5 5C4.5 2.7945 6.2945 1 8.5 1C10.7055 1 12.5 2.7945 12.5 5V6.5H4.5V5ZM1.5 7.5H3.5V9.5C3.5 9.776 3.724 10 4 10C4.276 10 4.5 9.776 4.5 9.5V7.5H12.5V9.5C12.5 9.776 12.724 10 13 10C13.276 10 13.5 9.776 13.5 9.5V7.5H15.5V16H1.5V7.5ZM15.5 19H1.5V17H15.5V19Z" fill="currentColor"></path>
        </svg>

    )

    const searchButton = (
            <svg className="nav-search-button" width="2rem" height="2rem" viewBox="0 0 16 17" >
                <g fillRule="evenodd" clipRule="evenodd" fill="currentColor">
                    <path d="M11.0105 11.724C9.84375 12.7271 8.326 13.3333 6.66667 13.3333C2.98477 13.3333 0 10.3486 0 6.66667C0 2.98477 2.98477 0 6.66667 0C10.3486 0 13.3333 2.98477 13.3333 6.66667C13.3333 8.32929 12.7247 9.84975 11.7181 11.0174L15.9969 15.2962L15.2898 16.0033L11.0105 11.724ZM12.3333 6.66667C12.3333 9.79628 9.79628 12.3333 6.66667 12.3333C3.53705 12.3333 1 9.79628 1 6.66667C1 3.53705 3.53705 1 6.66667 1C9.79628 1 12.3333 3.53705 12.3333 6.66667Z"></path>
                </g>
            </svg>

    )
    return (
        <>
            <header >

                <div className="logo-div"><img className="logo" src={logoImage} onClick={redirectHome}  /></div>
                <div className="user-funcs">
                    <a href="https://github.com/joeytsui1">Github</a>
                    <a href="https://www.linkedin.com/in/joey-tsui-5836a2240/">Linkedin</a>
                    <p>AngelLink</p>
                    <p>|</p>
                    {searchButton}
                    {loginButton}
                    {cartButton}
                </div>
            </header>
            <nav className="second-nav">
                <a className="second-nav-p" href="/brands/jordan">JORDAN</a>
                <a className="second-nav-p" href="/brands/nike">NIKE</a>
                <a className="second-nav-p" href="/brands/adidas">ADIDAS</a>
                <a className="second-nav-p" href="/brands/new-balance">NEW BALANCE</a>
                <a className="second-nav-p" href="/brands/asics">ASICS</a>
                <a className="second-nav-p" href="https://github.com/joeytsui1">GITHUB</a>
                <a className="second-nav-p" href="https://www.linkedin.com/in/joey-tsui-5836a2240/">LINKEDIN</a>
                <a className="second-nav-p" href="#">ANGELINK</a>
                <a className="second-nav-p" href="/products">ALL BRANDS</a>
            </nav>
        </>
    )
}

export default NavBar