import React, { useState, useRef, useEffect } from 'react';
import { MessageSquare, Send, ShoppingCart } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { ChatMessage, Product } from '../types';
import { useCartStore } from '../store/useCartStore';

export function ShoppingAssistant() {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const [context, setContext] = useState<{
    lastCategory?: string;
    priceRange?: { min: number; max: number };
    color?: string;
    size?: string;
  }>({});
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const addToCart = useCartStore(state => state.addItem);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  async function handleSendMessage(e: React.FormEvent) {
    e.preventDefault();
    if (!input.trim()) return;

    const userMessage: ChatMessage = {
      id: Date.now().toString(),
      content: input,
      role: 'user',
      timestamp: new Date().toISOString(),
    };

    setMessages((prev) => [...prev, userMessage]);
    setInput('');
    setLoading(true);

    try {
      const query = parseUserQuery(input);
      const products = await searchProducts(query);
      const response = generateResponse(input, products, query);
      
      const assistantMessage: ChatMessage = {
        id: (Date.now() + 1).toString(),
        content: response,
        role: 'assistant',
        timestamp: new Date().toISOString(),
        products: products.length > 0 ? products : undefined,
      };

      setMessages((prev) => [...prev, assistantMessage]);
      setContext(query);
    } catch (error) {
      console.error('Error processing message:', error);
    } finally {
      setLoading(false);
    }
  }

  function parseUserQuery(input: string) {
    const query: any = { ...context };
    const lowercaseInput = input.toLowerCase();

    // Extract price range
    const priceMatch = lowercaseInput.match(/under \$(\d+)/);
    if (priceMatch) {
      query.priceRange = { max: parseInt(priceMatch[1]) };
    }

    // Extract color
    const colors = ['red', 'blue', 'black', 'white', 'green', 'yellow', 'brown'];
    const colorMatch = colors.find(color => lowercaseInput.includes(color));
    if (colorMatch) {
      query.color = colorMatch;
    }

    // Extract category
    const categories = ['dress', 'shoe', 'watch', 'sunglasses', 'bag', 'mens_shirt', 'mens_jeans', 'perfume', 'jewelry', 'electronics'];
    const categoryMatch = categories.find(category => 
      lowercaseInput.includes(category) || 
      lowercaseInput.includes(category.replace('_', ' '))
    );
    if (categoryMatch) {
      query.category = categoryMatch;
    }

    // Extract specific product types
    if (lowercaseInput.includes('mobile') || lowercaseInput.includes('phone')) {
      query.category = 'electronics';
      query.tags = ['mobile', 'smartphone'];
    } else if (lowercaseInput.includes('laptop')) {
      query.category = 'electronics';
      query.tags = ['laptop'];
    } else if (lowercaseInput.includes('tv')) {
      query.category = 'electronics';
      query.tags = ['tv'];
    }

    return query;
  }

  async function searchProducts(query: any) {
    let dbQuery = supabase.from('products').select('*');

    if (query.category) {
      dbQuery = dbQuery.eq('category', query.category);
    }
    if (query.color) {
      dbQuery = dbQuery.eq('color', query.color);
    }
    if (query.priceRange?.max) {
      dbQuery = dbQuery.lte('price', query.priceRange.max);
    }
    if (query.tags) {
      dbQuery = dbQuery.contains('tags', query.tags);
    }

    const { data } = await dbQuery;
    return data || [];
  }

  function generateResponse(input: string, products: Product[], query: any): string {
    const lowercaseInput = input.toLowerCase();

    if (products.length > 0) {
      let response = `I found ${products.length} products that match your criteria. Here they are:\n\n`;
      
      products.forEach((product, index) => {
        response += `${index + 1}. ${product.name}\n`;
        response += `   Price: $${product.price.toFixed(2)}\n`;
        if (product.color) response += `   Color: ${product.color}\n`;
        if (product.brand) response += `   Brand: ${product.brand}\n`;
        if (product.specifications) {
          response += '   Specifications:\n';
          Object.entries(product.specifications).forEach(([key, value]) => {
            response += `   - ${key}: ${value}\n`;
          });
        }
        response += `   [View Image](${product.image_url})\n\n`;
      });

      response += "\nWould you like to add any of these items to your cart? Just let me know which one by its number or name.";
      return response;
    }

    if (lowercaseInput.includes('cart')) {
      const cartItems = useCartStore.getState().items;
      if (cartItems.length === 0) {
        return "Your cart is empty. Would you like me to help you find some products?";
      }
      let response = "Here's what's in your cart:\n\n";
      cartItems.forEach((item, index) => {
        response += `${index + 1}. ${item.product?.name} - Quantity: ${item.quantity} - $${(item.product?.price || 0 * item.quantity).toFixed(2)}\n`;
      });
      return response;
    }

    if (lowercaseInput.includes('help')) {
      return `I can help you with:
1. Finding products by category, color, or price range
2. Showing product details and images
3. Managing your shopping cart
4. Providing recommendations

Try asking something like:
- "Show me red dresses under $50"
- "What laptops do you have?"
- "Tell me about your watches"
- "Show me items in my cart"`;
    }

    return "I'm here to help you find the perfect products! You can ask about specific items, categories, or use filters like color and price range. For example, try 'show me blue shoes' or 'laptops under $1000'.";
  }

  return (
    <div className="max-w-2xl mx-auto bg-white rounded-lg shadow-lg overflow-hidden">
      <div className="p-4 bg-blue-600 text-white flex items-center gap-2">
        <MessageSquare className="w-5 h-5" />
        <h2 className="text-lg font-semibold">Shopping Assistant</h2>
      </div>

      <div className="h-[500px] flex flex-col">
        <div className="flex-1 overflow-y-auto p-4 space-y-4">
          {messages.map((message) => (
            <div
              key={message.id}
              className={`flex ${
                message.role === 'user' ? 'justify-end' : 'justify-start'
              }`}
            >
              <div
                className={`max-w-[80%] rounded-lg p-3 ${
                  message.role === 'user'
                    ? 'bg-blue-600 text-white'
                    : 'bg-gray-100 text-gray-900'
                }`}
              >
                <pre className="whitespace-pre-wrap font-sans">{message.content}</pre>
                {message.products && (
                  <div className="mt-4 grid grid-cols-2 gap-2">
                    {message.products.map((product) => (
                      <div
                        key={product.id}
                        className="bg-white rounded p-2 shadow-sm"
                      >
                        <img
                          src={product.image_url}
                          alt={product.name}
                          className="w-full h-32 object-cover rounded"
                        />
                        <div className="mt-2">
                          <p className="font-medium text-sm">{product.name}</p>
                          <p className="text-blue-600 font-bold">
                            ${product.price.toFixed(2)}
                          </p>
                          <button
                            onClick={() => addToCart(product)}
                            className="mt-2 w-full flex items-center justify-center gap-1 bg-blue-600 text-white px-2 py-1 rounded text-sm hover:bg-blue-700"
                          >
                            <ShoppingCart className="w-4 h-4" />
                            Add to Cart
                          </button>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
          ))}
          {loading && (
            <div className="flex justify-start">
              <div className="bg-gray-100 rounded-lg p-3">
                <div className="flex space-x-2">
                  <div className="w-2 h-2 bg-gray-400 rounded-full animate-bounce"></div>
                  <div className="w-2 h-2 bg-gray-400 rounded-full animate-bounce delay-100"></div>
                  <div className="w-2 h-2 bg-gray-400 rounded-full animate-bounce delay-200"></div>
                </div>
              </div>
            </div>
          )}
          <div ref={messagesEndRef} />
        </div>

        <form onSubmit={handleSendMessage} className="p-4 border-t">
          <div className="flex gap-2">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              placeholder="Ask about our products..."
              className="flex-1 rounded-lg border border-gray-300 px-4 py-2 focus:outline-none focus:border-blue-500"
            />
            <button
              type="submit"
              disabled={loading}
              className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50"
            >
              <Send className="w-5 h-5" />
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}