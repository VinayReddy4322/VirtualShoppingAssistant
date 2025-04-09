/*
  # Add more products to the catalog

  1. Changes
    - Add more products to each category
    - Update existing products with additional details
*/

-- Add more dresses
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Floral Maxi Dress', 'Elegant floral print maxi dress perfect for summer events', 89.99, 'dress', 'https://images.unsplash.com/photo-1572804013427-4d7ca7268217', 'Blue', ARRAY['XS', 'S', 'M', 'L'], 'Sunshine', '{"material": "Chiffon", "style": "Maxi"}', 45, ARRAY['summer', 'floral', 'elegant']),
('Cocktail Party Dress', 'Stunning cocktail dress for special occasions', 129.99, 'dress', 'https://images.unsplash.com/photo-1595777457583-95e059d581b8', 'Red', ARRAY['S', 'M', 'L'], 'Elegance', '{"material": "Satin", "style": "Fitted"}', 30, ARRAY['party', 'cocktail']),
('Casual Summer Dress', 'Light and comfortable summer dress', 49.99, 'dress', 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1', 'Yellow', ARRAY['XS', 'S', 'M', 'L', 'XL'], 'SunStyle', '{"material": "Cotton", "style": "A-line"}', 60, ARRAY['casual', 'summer']),
('Evening Gown', 'Elegant floor-length evening gown', 199.99, 'dress', 'https://images.unsplash.com/photo-1566174053879-31528523f8ae', 'Black', ARRAY['S', 'M', 'L'], 'GlamourNight', '{"material": "Silk", "style": "Mermaid"}', 25, ARRAY['formal', 'evening']);

-- Add more shoes
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Athletic Running Shoes', 'High-performance running shoes for athletes', 119.99, 'shoe', 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', 'Blue', ARRAY['7', '8', '9', '10', '11'], 'SpeedRunner', '{"type": "Running", "material": "Mesh"}', 80, ARRAY['sports', 'running']),
('Classic Leather Boots', 'Timeless leather boots for any occasion', 159.99, 'shoe', 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f', 'Brown', ARRAY['8', '9', '10', '11'], 'Heritage', '{"material": "Leather", "style": "Boot"}', 40, ARRAY['casual', 'leather']),
('Casual Sneakers', 'Comfortable everyday sneakers', 79.99, 'shoe', 'https://images.unsplash.com/photo-1549298916-b41d501d3772', 'White', ARRAY['6', '7', '8', '9', '10'], 'UrbanStyle', '{"material": "Canvas", "style": "Sneaker"}', 65, ARRAY['casual', 'daily']),
('High Heels', 'Elegant high heels for formal occasions', 89.99, 'shoe', 'https://images.unsplash.com/photo-1543163521-1bf539c55dd2', 'Red', ARRAY['6', '7', '8', '9'], 'Glamour', '{"height": "4 inch", "material": "Suede"}', 35, ARRAY['formal', 'evening']);

-- Add more watches
INSERT INTO products (name, description, price, category, image_url, brand, specifications, stock_count, tags) VALUES
('Classic Chronograph Watch', 'Elegant chronograph watch with leather strap', 299.99, 'watch', 'https://images.unsplash.com/photo-1524592094714-0f0654e20314', 'Timeless', '{"movement": "Quartz", "water_resistant": true}', 30, ARRAY['chronograph', 'leather']),
('Smart Fitness Watch', 'Advanced fitness tracking smartwatch', 199.99, 'watch', 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a', 'TechWear', '{"features": "Heart rate, GPS", "battery": "5 days"}', 50, ARRAY['smart', 'fitness']),
('Luxury Gold Watch', 'Premium gold-plated watch with metal strap', 499.99, 'watch', 'https://images.unsplash.com/photo-1587836374828-4dbafa94cf0e', 'LuxuryTime', '{"material": "Gold plated", "movement": "Automatic"}', 20, ARRAY['luxury', 'metal']),
('Minimalist Watch', 'Clean and simple design watch', 149.99, 'watch', 'https://images.unsplash.com/photo-1523170335258-f5ed11844a49', 'Minimal', '{"style": "Minimalist", "case": "Stainless steel"}', 40, ARRAY['minimal', 'casual']);

-- Add more electronics
INSERT INTO products (name, description, price, category, image_url, brand, specifications, stock_count, tags) VALUES
('Premium Smartphone', 'Latest flagship smartphone with advanced features', 999.99, 'electronics', 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab', 'TechPro', '{"screen": "6.7 inch OLED", "storage": "256GB", "camera": "108MP"}', 45, ARRAY['mobile', 'smartphone']),
('4K Smart TV 65"', 'Large 4K smart TV with HDR', 1299.99, 'electronics', 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1', 'ViewMaster', '{"resolution": "4K", "size": "65 inch", "smart": true}', 20, ARRAY['tv', 'entertainment']),
('Gaming Laptop', 'High-performance gaming laptop', 1499.99, 'electronics', 'https://images.unsplash.com/photo-1593642702821-c8da6771f0c6', 'GamePro', '{"processor": "Intel i9", "gpu": "RTX 3080", "ram": "32GB"}', 15, ARRAY['laptop', 'gaming']),
('Wireless Earbuds', 'Premium wireless earbuds with noise cancellation', 199.99, 'electronics', 'https://images.unsplash.com/photo-1605464315542-bda3e2f4e605', 'AudioTech', '{"type": "True Wireless", "battery": "24h", "anc": true}', 60, ARRAY['audio', 'wireless']);

-- Add more sunglasses
INSERT INTO products (name, description, price, category, image_url, brand, specifications, stock_count, tags) VALUES
('Classic Aviator Sunglasses', 'Timeless aviator style sunglasses', 129.99, 'sunglasses', 'https://images.unsplash.com/photo-1511499767150-a48a237f0083', 'SunStyle', '{"style": "Aviator", "protection": "UV400"}', 40, ARRAY['classic', 'aviator']),
('Sport Sunglasses', 'Performance sunglasses for athletes', 159.99, 'sunglasses', 'https://images.unsplash.com/photo-1572635196237-14b3f281503f', 'SportVision', '{"material": "Lightweight", "polarized": true}', 35, ARRAY['sports', 'performance']),
('Designer Oversized Sunglasses', 'Fashionable oversized sunglasses', 179.99, 'sunglasses', 'https://images.unsplash.com/photo-1577803645773-f96470509666', 'LuxeShade', '{"style": "Oversized", "material": "Premium"}', 25, ARRAY['fashion', 'luxury']),
('Retro Round Sunglasses', 'Vintage-inspired round frame sunglasses', 99.99, 'sunglasses', 'https://images.unsplash.com/photo-1619089662706-aac7b2a2fea5', 'RetroVibe', '{"style": "Round", "vintage": true}', 30, ARRAY['retro', 'vintage']);