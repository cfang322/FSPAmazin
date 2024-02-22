import linkedin from '../../images/linkedin.png';
import git from '../../images/github.png';
import './Footer.css';

function Footer() {
    const scrollToTop = () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth',
        });
    };
    
    return (
        <div className='footerDiv'>
            <div className='upperFooter' onClick={scrollToTop}>
                <p className='backToTopP'>Back to Top</p>
            </div>
            <div className='bottomFooter'>
                <div className='linksDiv'>
                    <div className='git'>
                        <a href="https://github.com/cfang322">
                            <img src={git} alt="github-link" />
                        </a>
                    </div>
                    <div className='linkedin'>
                        <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">
                            <img src={linkedin} alt="linkedin-link" />
                        </a>
                    </div>
                    <p className='loginLinkP'>Amazin 2024</p>
                </div>
            </div>
        </div>
    );
}

export default Footer;