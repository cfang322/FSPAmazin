import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';
import { NavLink } from 'react-router-dom';
import { fetchProducts, selectProductsArray } from '../../store/product';
import './ProductsIndex.css';
import placeholder from '../../images/placeholder.svg';

function ProductsIndex() {
    const dispatch = useDispatch();
    const products = useSelector(selectProductsArray);

    useEffect(() => {
        dispatch(fetchProducts());
    }, [dispatch]);

    return (
        <ul className='productsIndexPage'>
            <div className="productsIndexDivider"></div>
            <div className="productsContainer">
                {products.map((product) => (
                    <NavLink key={product.id} to={`/products/${product.id}`}>
                        <div key={product.id} className="productContainer">
                            <img src={placeholder} alt={product.name} />
                            <div className="containerContent">
                                <p className='productName'>{product.name}</p>
                                <p className='productPrice'>${product.price}</p>
                            </div>
                        </div>
                    </NavLink>
                ))}
            </div>
        </ul>
    );
}

export default ProductsIndex;