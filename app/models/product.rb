require_relative('../db/sql_runner')

class Product

  attr_reader :id, :name, :product_code, :description, :cost_price, :category_id, :supplier_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @product_code = options['product_code']
    @description = options['description']
    @cost_price = options['cost_price'].to_i
    @supplier_id = options['supplier_id'].to_i
    @category_id = options['category_id'].to_i
    # @image_url = options['image_url'] (NO LONGER NEEDED.)
  end

  def save()
    sql = "INSERT INTO products
    (name, product_code, description, cost_price, category_id, supplier_id)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @product_code, @description, @cost_price, @category_id, @supplier_id]
    product = SqlRunner.run(sql, values).first
    @id = product['id'].to_i
  end

  def update()
    sql = "UPDATE products SET
    (name, product_code, description, cost_price, category_id, supplier_id)
    =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @product_code, @description, @cost_price, @category_id, @supplier_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stock()
    sql = "SELECT * FROM stock WHERE product_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Stock.new(results.first)
  end

  def supplier()
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [@supplier_id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end

  def category()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    result = Product.new(product.first) #?? Could result be replaced with return to remove next line.
    return result
  end

  def self.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    result = products.map{ |product| Product.new(product)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end
end
