export interface Product {
  id: string;
  name: string;
  description: string;
  price: number;
  category: 'dress' | 'shoe' | 'watch' | 'sunglasses' | 'bag' | 'mens_shirt' | 'mens_jeans' | 'perfume' | 'jewelry' | 'electronics';
  image_url: string;
  color?: string;
  size?: string[];
  brand?: string;
  specifications?: Record<string, any>;
  reviews?: Array<{
    rating: number;
    comment: string;
    user_id: string;
  }>;
  rating?: number;
  stock_count?: number;
  tags?: string[];
  popularity_score?: number;
}

export interface User {
  id: string;
  email: string;
  role: 'user' | 'admin';
}

export interface ChatMessage {
  id: string;
  content: string;
  role: 'user' | 'assistant';
  timestamp: string;
  products?: Product[];
}

export interface CartItem {
  product_id: string;
  quantity: number;
  product?: Product;
}

export interface ShoppingCart {
  items: CartItem[];
  total: number;
}