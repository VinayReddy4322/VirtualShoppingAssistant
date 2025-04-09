import React from 'react';
import { Link } from 'react-router-dom';
import { ShoppingBag, User, ShoppingCart } from 'lucide-react';
import { useAuthStore } from '../store/useAuthStore';
import { useCartStore } from '../store/useCartStore';

export function Navigation() {
  const { user, signOut } = useAuthStore();
  const cartItems = useCartStore(state => state.items);

  return (
    <nav className="bg-white shadow-lg">
      <div className="container mx-auto px-4">
        <div className="flex justify-between items-center h-16">
          <Link to="/" className="flex items-center space-x-2">
            <ShoppingBag className="h-6 w-6 text-indigo-600" />
            <span className="text-xl font-bold text-gray-900">AI Shop</span>
          </Link>
          
          <div className="flex items-center space-x-4">
            <Link
              to="/cart"
              className="flex items-center space-x-1 text-gray-700 hover:text-indigo-600"
            >
              <div className="relative">
                <ShoppingCart className="h-6 w-6" />
                {cartItems.length > 0 && (
                  <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                    {cartItems.length}
                  </span>
                )}
              </div>
            </Link>
            {user ? (
              <>
                <Link
                  to="/assistant"
                  className="text-gray-700 hover:text-indigo-600"
                >
                  AI Assistant
                </Link>
                {user.role === 'admin' && (
                  <Link
                    to="/admin"
                    className="text-gray-700 hover:text-indigo-600"
                  >
                    Admin
                  </Link>
                )}
                <button
                  onClick={() => signOut()}
                  className="text-gray-700 hover:text-indigo-600"
                >
                  Sign Out
                </button>
              </>
            ) : (
              <Link
                to="/auth"
                className="flex items-center space-x-1 text-gray-700 hover:text-indigo-600"
              >
                <User className="h-5 w-5" />
                <span>Sign In</span>
              </Link>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}