import { useParams, useNavigate, NavLink } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect, useState } from 'react';
import { fetchProduct, selectProduct } from '../../store/product';
import { createCartItem, memoizedSelectCartItems, updateCartItem } from '../../store/cartItem';
import placeholder from '../../images/placeholder.svg';
import git from '../../images/github.png';
import linkedin from '../../images/linkedin.png';
// import logo from '../../images/logo.png';
import './ItemIndex.css';

const ItemIndex = () => {
  const dispatch = useDispatch();
  const { productId } = useParams();
  const product = useSelector(selectProduct(productId));
  const cartItems = useSelector(memoizedSelectCartItems);
  const product_id = parseInt(productId);
  const [quantity, setQuantity] = useState(1);
  const sessionUser = useSelector(state => state.session.user);
  const navigate = useNavigate();
  
  useEffect(() => {
    dispatch(fetchProduct(productId));
  }, [dispatch, productId]);
  // if the product is not yet available or if the description is not an array
  if (!product) {
      return <div>Loading...</div>;
  };
  // if product.description is not an array or is empty
  if (!Array.isArray(product.description) || product.description.length === 0) {
      return <div>No description available</div>;
  }
  
  const parsedDescription = JSON.parse(product.description[0]);
  
  const handleAddCartItem = async (e) => {
    e.preventDefault();
    if (sessionUser) {
      const user_id = sessionUser.id;
      const productToAdd = { quantity, product_id, user_id };
      const existingCartItem = cartItems.find(
        (item) => item.productId === product.id
      );
      if (existingCartItem) {
        const updatedCartItem = {
          ...existingCartItem,
          quantity: existingCartItem.quantity + quantity
        };
        dispatch(updateCartItem(updatedCartItem));
      } else {
        dispatch(createCartItem(productToAdd));
      };
    } else {
      navigate('/login');
    };
  };
  
  const handleQuantityChange = (e) => setQuantity(parseInt(e.target.value, 10));
  
  return (
    <div className="ItemIndexPage">
        <div className='itemImageContainer'>
            {/* <img src={product.photoUrl} alt={product.name} /> */}
        </div>
        
        <div className="itemContentContainer">
            <div className='middleProductPriceDiv'>
                <h3 className='middleProductPriceH3'>{product.name}</h3>
            </div>
            <div className="middlePriceDivider"></div>
            <div className='middleProductPriceDiv'>
                <p className='middleProductPriceP'>${product.price}</p>
            </div>
            <div>
              <p className='aboutItemPTag'>About this item:</p>
              <ul className='productDetailList'>
                  {parsedDescription.map((detail, index) => (
                  <li className='productDetail' key={`${product.id}_${index}`}>{detail}</li>
                  ))}
              </ul>
            </div>
        </div>
        
        <div className='addToCartDiv'>
            <div className='buyNowDiv'>
                <h3 className='buyNowH3'>Buy new:</h3>
            </div>
            <div className='productPriceDiv'>
                <h1 className='productPriceH1'>${product.price}</h1>
            </div>
            <div className='inStockDiv'>
                <h1 className='inStockH1'>In Stock</h1>
            </div>
            <div className='quantityDiv'>
                <span>Quantity: </span>
                <select 
                  className='quantityDropDown' 
                  name="quantity"
                  value={quantity}
                  onChange={handleQuantityChange}>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                </select>
            </div>
            <div className='addToCartBtnDiv'>
                <button onClick={handleAddCartItem} className='addToCartBtn'>Add to cart</button>
            </div>
        </div>
        
      <ul className='productFooter'>
        <div className='loginLinks'>
          <span className='loginGit'>
            <a href="https://github.com/cfang322">
              <img src={git} alt="git-link" />
            </a>
          </span>
          <span className='loginLinkedin'>
            <a href="https://www.linkedin.com/in/yaqi-fang-125807250/">
              <img src={linkedin} alt="linkedin-link" />
            </a>
          </span>
          <div className="backToHome">
            <NavLink to="/">
              <p className='loginLink'>Back to Home</p>
            </NavLink>
          </div>
        </div>
      </ul>
    </div>
  )
}

export default ItemIndex;