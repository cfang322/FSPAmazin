import './Rating.css';

const Rating = ({ rating }) => {
    const renderStars = () => {
        const totalStars = 5;
        return Array.from({ length: totalStars }, (_, index) => (
            <span
            key={index}
            className={`star ${index < rating ? 'filled' : ''}`}
            >
            &#9733;
            </span>
        ));
    };
    
    return <div className="star-rating">{renderStars()}</div>;
};

export default Rating;