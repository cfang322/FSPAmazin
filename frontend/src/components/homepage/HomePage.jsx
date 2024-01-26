// import { NavLink } from "react-router-dom";
import banner from "../../images/amazon-banner2.jpg";
import './HomePage.css';

const HomePage = () => {
    return (
        <div className="homePageDiv">
            <div className="bannerDiv">
                <img className="bannerImg" src={banner} alt="banner-img"/>
            </div>
            {/* <div className="sectionsDiv">
                <div className="allProductsDiv">
                    <h1 id="allProductsH1">Save Now!</h1>
                    <NavLink id="allProductsAncho" href="/products">
                        <img src="" alt="allProductsDivImg" className="allProductsDivImg"/>
                    </NavLink>
                </div>
                <div className="homeDiv">

                </div>
                <div className="beautyDiv">

                </div>
                <div className="groceryDiv">

                </div>
            </div> */}
        </div>
    );
}

export default HomePage;