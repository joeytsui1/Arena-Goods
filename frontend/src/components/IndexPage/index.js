
import "./index.css"

const IndexPage = () => {

    return (
        <>
            <div className="home-div">
                <div className="home-background-pic-textbox">
                    <a className="home-textbox-link">AIR JORDAN</a>
                    <h1 className="home-textbox-header">Nothing Beats the Original</h1>
                    <p className="home-textbox-p">When it comes to Air Jordans, nothing beats the colorway Michael Jordan wore on his feets</p>
                    <button className="home-textbox-button">Shop Now</button>
                </div>
                <img className="home-background-pic"  src="https://www.stadiumgoods.com/BWStaticContent/54000/b6f824e8-1118-42e3-993c-9e3686e5b449_20230206-ogjordans-desktop.jpg" alt="A description of the image" ></img>
            </div>
        </>

    )
}

export default IndexPage