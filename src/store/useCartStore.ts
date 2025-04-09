import { create } from 'zustand';
import { CartItem, Product } from '../types';

interface CartState {
  items: CartItem[];
  total: number;
  addItem: (product: Product, quantity?: number) => void;
  removeItem: (productId: string) => void;
  updateQuantity: (productId: string, quantity: number) => void;
  clearCart: () => void;
  calculateTotal: () => number;
}

export const useCartStore = create<CartState>((set, get) => ({
  items: [],
  total: 0,
  addItem: (product: Product, quantity = 1) => {
    const items = get().items;
    const existingItem = items.find(item => item.product_id === product.id);

    if (existingItem) {
      const updatedItems = items.map(item =>
        item.product_id === product.id
          ? { ...item, quantity: item.quantity + quantity }
          : item
      );
      set({ items: updatedItems, total: get().calculateTotal() });
    } else {
      set({
        items: [...items, { product_id: product.id, quantity, product }],
        total: get().calculateTotal()
      });
    }
  },
  removeItem: (productId: string) => {
    set(state => ({
      items: state.items.filter(item => item.product_id !== productId),
      total: get().calculateTotal()
    }));
  },
  updateQuantity: (productId: string, quantity: number) => {
    if (quantity < 1) return;
    set(state => ({
      items: state.items.map(item =>
        item.product_id === productId ? { ...item, quantity } : item
      ),
      total: get().calculateTotal()
    }));
  },
  clearCart: () => set({ items: [], total: 0 }),
  calculateTotal: () => {
    const items = get().items;
    return items.reduce((total, item) => {
      const price = item.product?.price || 0;
      return total + price * item.quantity;
    }, 0);
  }
}));