import banner from "../../images/amazon-banner2.jpg";
import './HomePage.css';

const HomePage = () => {
    return (
        <div className="homePageDiv">
            <div className="bannerDiv">
                <img className="bannerImg" src={banner} alt="banner-img"/>
            </div>
        </div>
    );
}

export default HomePage;