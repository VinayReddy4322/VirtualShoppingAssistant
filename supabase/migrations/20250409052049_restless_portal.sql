/*
  # Add men's clothing and perfume products

  1. New Products
    - Add men's jeans
    - Add men's shirts
    - Add perfumes
*/

-- Add men's jeans
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Classic Fit Jeans', 'Comfortable classic fit denim jeans', 59.99, 'mens_jeans', 'https://images.unsplash.com/photo-1542272604-787c3835535d', 'Blue', ARRAY['30x32', '32x32', '34x32', '36x32'], 'DenimCo', '{"material": "Cotton", "fit": "Classic"}', 75, ARRAY['classic', 'denim']),
('Slim Fit Dark Jeans', 'Modern slim fit dark wash jeans', 69.99, 'mens_jeans', 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246', 'Dark Blue', ARRAY['30x32', '32x32', '34x32'], 'UrbanDenim', '{"material": "Stretch Denim", "fit": "Slim"}', 60, ARRAY['slim', 'dark']),
('Relaxed Fit Jeans', 'Casual relaxed fit light wash jeans', 54.99, 'mens_jeans', 'https://images.unsplash.com/photo-1602293589930-45aad59ba3ab', 'Light Blue', ARRAY['32x32', '34x32', '36x32', '38x32'], 'ComfortDenim', '{"material": "Cotton Blend", "fit": "Relaxed"}', 50, ARRAY['relaxed', 'casual']),
('Straight Leg Jeans', 'Classic straight leg black jeans', 64.99, 'mens_jeans', 'https://images.unsplash.com/photo-1584370848010-d7fe6bc767ec', 'Black', ARRAY['30x32', '32x32', '34x32', '36x32'], 'BlackDenim', '{"material": "Cotton", "fit": "Straight"}', 45, ARRAY['straight', 'black']);

-- Add men's shirts
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Business Dress Shirt', 'Professional cotton dress shirt', 49.99, 'mens_shirt', 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c', 'White', ARRAY['S', 'M', 'L', 'XL'], 'ExecutiveStyle', '{"material": "Cotton", "fit": "Regular"}', 100, ARRAY['formal', 'business']),
('Casual Oxford Shirt', 'Classic Oxford button-down shirt', 45.99, 'mens_shirt', 'https://images.unsplash.com/photo-1596755094661-596f2d4d4f30', 'Blue', ARRAY['M', 'L', 'XL'], 'CasualCo', '{"material": "Oxford Cotton", "fit": "Regular"}', 80, ARRAY['casual', 'oxford']),
('Slim Fit Dress Shirt', 'Modern slim fit cotton shirt', 54.99, 'mens_shirt', 'https://images.unsplash.com/photo-1589310243389-96a5483213a8', 'Light Blue', ARRAY['S', 'M', 'L'], 'ModernMan', '{"material": "Cotton Blend", "fit": "Slim"}', 65, ARRAY['slim', 'formal']),
('Flannel Shirt', 'Warm and comfortable flannel shirt', 39.99, 'mens_shirt', 'https://images.unsplash.com/photo-1638389746768-ff6a5a885b5d', 'Red Plaid', ARRAY['M', 'L', 'XL', 'XXL'], 'OutdoorStyle', '{"material": "Flannel", "fit": "Regular"}', 70, ARRAY['casual', 'flannel']);

-- Add perfumes
INSERT INTO products (name, description, price, category, image_url, brand, specifications, stock_count, tags) VALUES
('Ocean Breeze Perfume', 'Fresh and invigorating ocean scent', 79.99, 'perfume', 'https://images.unsplash.com/photo-1594035910387-fea47794261f', 'LuxeScents', '{"type": "Eau de Parfum", "size": "50ml"}', 40, ARRAY['fresh', 'ocean']),
('Floral Paradise', 'Elegant floral fragrance for women', 89.99, 'perfume', 'https://images.unsplash.com/photo-1592945403244-b3fbafd7f539', 'BloomingLuxe', '{"type": "Eau de Parfum", "size": "75ml"}', 35, ARRAY['floral', 'elegant']),
('Midnight Mystery', 'Deep and mysterious evening fragrance', 99.99, 'perfume', 'https://images.unsplash.com/photo-1541643600914-78b084683601', 'NightLuxe', '{"type": "Eau de Parfum", "size": "100ml"}', 30, ARRAY['evening', 'mysterious']),
('Citrus Fresh', 'Energizing citrus blend perfume', 69.99, 'perfume', 'https://images.unsplash.com/photo-1587017539504-67cfbddac569', 'FreshScents', '{"type": "Eau de Toilette", "size": "50ml"}', 45, ARRAY['fresh', 'citrus']);