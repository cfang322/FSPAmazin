import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { Outlet, createBrowserRouter, RouterProvider, useLocation } from 'react-router-dom';
import * as sessionActions from './store/session';
import LoginForm from './components/session/LoginForm';
import SignupForm from './components/session/SignupForm';
import Navigation from './components/Navigation/Navigation';
import ProductsIndex from './components/product/ProductsIndex';
import ItemIndex from './components/product/ItemIndex';
import CartIndex from './components/cart/CartIndex';
import HomePage from './components/homepage/HomePage';
import CheckoutIndex from './components/checkout/Checkout';
import Footer from './components/Navigation/Footer';

function Layout() {
  const dispatch = useDispatch();
  const [isLoaded, setIsLoaded] = useState(false);
  const [showNavigation, setShowNavigation] = useState(true);
  const location = useLocation();

  useEffect(() => {
    dispatch(sessionActions.restoreSession()).then(() => {
      setIsLoaded(true);
    });
  }, [dispatch]);

  useEffect(() => {
    // Check if the current location is '/login' or '/signup'
    const isAuthPage = location.pathname === '/login' || location.pathname === '/signup';

    // Update showNavigation state based on the current location
    setShowNavigation(!isAuthPage);
  }, [location.pathname]);

  return (
    <>
      {showNavigation && <Navigation />}
      {isLoaded && <Outlet />}
    </>
  );
}

const router = createBrowserRouter([
  {
    path: '/',
    element: <Layout />,
    children: [
      {
        path: '/',
        element: 
          <>
            <HomePage />
            <Footer />
          </>
      },
      {
        path: 'login',
        element: <LoginForm />
      },
      {
        path: 'signup',
        element: <SignupForm />
      },
      {
        path: 'products',
        element:
          <>
            <ProductsIndex />
            <Footer />
          </>
      },
      {
        path: 'products/:productId',
        element: 
          <>
            <ItemIndex />
            <Footer />
          </>
      },
      {
        path: "cart",
        element: 
          <>
            <CartIndex />
            <Footer />
          </>
      },
      {
        path: "checkout",
        element: 
          <>
            <CheckoutIndex />
            <Footer />
          </>
      }
    ]
  }
]);

function App() {
  return (
    <RouterProvider router={router} />
  );
}

export default App;
