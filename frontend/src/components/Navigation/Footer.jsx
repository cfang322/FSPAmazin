import './Footer.css';

function Footer() {
    const scrollToTop = () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth',
        });
    };

    return (
        <>
            <div className='footerDiv'>
                <ul className='upperHomeFooter' onClick={scrollToTop}>
                    <p className='backToTopP'>Back to top</p>
                </ul>
                <ul className='homeFooter'>
                    <div className='loginLinks'>
                        <span className='loginGit'>
                            <a href="https://github.com/cfang322">
                                <img src={git} alt="github-link" />
                            </a>
                        </span>
                        <span className='loginLinkedin'>
                            <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">
                                <img src={linkedin} alt="linkedin-link" />
                            </a>
                        </span>
                        <p className='loginLinkP'>Amazin 2024</p>
                    </div>
                </ul>
            </div>
        </>
    );
}

export default Footer;