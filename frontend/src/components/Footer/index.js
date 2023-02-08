import "./index.css"
const Footer = () => {
    return (
        <>
            <footer className="footer-wrapper">
                <div>
                    <form className="footer-form">
                        <p className="footer-p">Be the first to hear about new <br></br>releases, special offers and more.</p>
                        <input className="footer-input" placeholder="Email Address*"></input>
                        <button className="footer-sign-button">Sign Up</button>
                        <p>Opt out at any time by clicking Unsubscribe at the bottom of any of our <br></br>emails. By signing up you agree with our Terms and Conditions and <br></br>Privacy Policy</p>
                    </form>
                </div>
                <div className="footer-refer">
                    <p className="footer-refer-p">Give your friends $20 off and get $20 off <br></br> when they make a purchase</p>
                    <button className="refer-button">REFER A FRIEND</button>
                </div>
            </footer>
        </>
    )
}

export default Footer