/*
  # Create products table and sample data

  1. New Tables
    - `products`
      - `id` (uuid, primary key)
      - `name` (text)
      - `description` (text)
      - `price` (numeric)
      - `category` (text)
      - `image_url` (text)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS on `products` table
    - Add policy for public read access
*/

CREATE TABLE IF NOT EXISTS products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text NOT NULL,
  price numeric(10,2) NOT NULL,
  category text NOT NULL,
  image_url text NOT NULL,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access"
  ON products
  FOR SELECT
  TO public
  USING (true);

-- Insert sample products
INSERT INTO products (name, description, price, category, image_url) VALUES
  ('Classic White Sneakers', 'Comfortable everyday sneakers with modern design', 79.99, 'shoe', 'https://images.unsplash.com/photo-1549298916-b41d501d3772'),
  ('Running Performance Shoes', 'High-performance running shoes for athletes', 129.99, 'shoe', 'https://images.unsplash.com/photo-1542291026-7eec264c27ff'),
  ('Elegant Evening Dress', 'Perfect for special occasions', 199.99, 'dress', 'https://images.unsplash.com/photo-1595777457583-95e059d581b8'),
  ('Summer Floral Dress', 'Light and breezy summer dress with floral pattern', 89.99, 'dress', 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1'),
  ('Leather Watch', 'Classic leather strap watch with gold finish', 299.99, 'watch', 'https://images.unsplash.com/photo-1524592094714-0f0654e20314'),
  ('Designer Sunglasses', 'UV protection sunglasses with modern design', 159.99, 'sunglasses', 'https://images.unsplash.com/photo-1511499767150-a48a237f0083'),
  ('Leather Tote Bag', 'Spacious leather tote for everyday use', 149.99, 'bag', 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa');