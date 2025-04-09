/*
  # Enhance Product Catalog

  1. Schema Updates
    - Add new categories to products table
    - Add additional product metadata columns
    - Add cart and order tracking

  2. Changes
    - Modify products table to support new categories and features
    - Add columns for detailed product information
    - Add columns for tracking product popularity
*/

-- Add new columns to products table
ALTER TABLE products 
ADD COLUMN IF NOT EXISTS color text,
ADD COLUMN IF NOT EXISTS size text[],
ADD COLUMN IF NOT EXISTS brand text,
ADD COLUMN IF NOT EXISTS specifications jsonb,
ADD COLUMN IF NOT EXISTS reviews jsonb[] DEFAULT '{}',
ADD COLUMN IF NOT EXISTS rating numeric(3,2) DEFAULT 0,
ADD COLUMN IF NOT EXISTS stock_count integer DEFAULT 0,
ADD COLUMN IF NOT EXISTS tags text[] DEFAULT '{}',
ADD COLUMN IF NOT EXISTS popularity_score integer DEFAULT 0;

-- Insert sample products for each category
-- Dresses
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Floral Summer Dress', 'Beautiful floral print dress perfect for summer', 45.99, 'dress', 'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446', 'Red', ARRAY['XS', 'S', 'M', 'L'], 'Summer Bloom', '{"material": "Cotton", "style": "A-line"}', 50, ARRAY['summer', 'floral', 'casual']),
('Evening Cocktail Dress', 'Elegant black cocktail dress', 89.99, 'dress', 'https://images.unsplash.com/photo-1566174053879-31528523f8ae', 'Black', ARRAY['S', 'M', 'L'], 'Elegance', '{"material": "Silk blend", "style": "Fitted"}', 30, ARRAY['evening', 'formal']),
('Maxi Beach Dress', 'Flowing maxi dress perfect for beach days', 59.99, 'dress', 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1', 'Blue', ARRAY['S', 'M', 'L', 'XL'], 'Coastal', '{"material": "Rayon", "style": "Maxi"}', 40, ARRAY['beach', 'summer']);

-- Shoes
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Running Performance Shoes', 'High-performance running shoes with cushioning', 129.99, 'shoe', 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', 'Blue', ARRAY['7', '8', '9', '10', '11'], 'SpeedRunner', '{"type": "Running", "material": "Mesh"}', 75, ARRAY['sports', 'running']),
('Classic Leather Boots', 'Timeless leather boots for any occasion', 159.99, 'shoe', 'https://images.unsplash.com/photo-1608256246200-53e635b5b65f', 'Brown', ARRAY['8', '9', '10', '11'], 'Heritage', '{"material": "Leather", "style": "Boot"}', 45, ARRAY['casual', 'leather']);

-- Men's Shirts
INSERT INTO products (name, description, price, category, image_url, color, size, brand, specifications, stock_count, tags) VALUES
('Classic Oxford Shirt', 'Timeless Oxford cotton shirt', 49.99, 'mens_shirt', 'https://images.unsplash.com/photo-1596755094514-f87e34085b2c', 'White', ARRAY['S', 'M', 'L', 'XL'], 'Classic Man', '{"material": "Cotton", "fit": "Regular"}', 100, ARRAY['formal', 'business']),
('Casual Denim Shirt', 'Comfortable denim shirt for casual wear', 45.99, 'mens_shirt', 'https://images.unsplash.com/photo-1588359348347-9bc6cbbb689e', 'Blue', ARRAY['M', 'L', 'XL'], 'DenimCo', '{"material": "Denim", "fit": "Regular"}', 80, ARRAY['casual', 'denim']);

-- Electronics
INSERT INTO products (name, description, price, category, image_url, brand, specifications, stock_count, tags) VALUES
('Pro Laptop 15"', 'High-performance laptop for professionals', 1299.99, 'electronics', 'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9', 'TechPro', '{"processor": "Intel i7", "ram": "16GB", "storage": "512GB SSD"}', 30, ARRAY['laptop', 'computer']),
('4K Smart TV 55"', 'Crystal clear 4K smart TV', 699.99, 'electronics', 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1', 'ViewMaster', '{"resolution": "4K", "size": "55 inch", "smart": true}', 25, ARRAY['tv', 'entertainment']),
('Smartphone Pro Max', 'Latest flagship smartphone', 999.99, 'electronics', 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab', 'PhoneTech', '{"screen": "6.7 inch", "storage": "256GB", "camera": "48MP"}', 50, ARRAY['mobile', 'smartphone']);

-- Jewelry
INSERT INTO products (name, description, price, category, image_url, brand, specifications, stock_count, tags) VALUES
('Diamond Pendant Necklace', 'Elegant diamond pendant necklace', 599.99, 'jewelry', 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338', 'LuxeGems', '{"material": "18K Gold", "stone": "Diamond"}', 15, ARRAY['necklace', 'diamond']),
('Pearl Earrings', 'Classic pearl stud earrings', 199.99, 'jewelry', 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908', 'PearlLux', '{"material": "14K Gold", "stone": "Pearl"}', 25, ARRAY['earrings', 'pearl']);