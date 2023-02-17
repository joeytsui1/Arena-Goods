import "./index.css"
import { useHistory } from "react-router-dom"
const Footer = () => {
    const history = useHistory()

    function handleClick() {
        history.push('/signup');
    }

    return (
        <>
            <footer className="footer-wrapper">
                <div>
                    <form className="footer-form">
                        <p className="footer-p">Be the first to hear about new <br></br>releases, special offers and more.</p>
                        <button onClick={handleClick} className="footer-sign-button">Sign Up</button>
                        <p>Opt out at any time by clicking Unsubscribe at the bottom of any of our <br></br>emails. By signing up you agree with our Terms and Conditions and <br></br>Privacy Policy</p>
                    </form>
                </div>
                <div className="footer-refer">
                    <p className="footer-refer-p">Have any job offers for me? <br></br> Go to my Linkedin!</p>
                    <button className="refer-button">Linkedin</button>
                </div>
            </footer>
            {/* <footer>
                <div>
                    <h3>About</h3>
                    <ul>
                        <li>

                        </li>
                    </ul>
                </div>
            </footer> */}
        </>
    )
}

export default Footer