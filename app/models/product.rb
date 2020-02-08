require_relative('../db/sql_runner')

class Product

  attr_reader :id, :name, :product_code, :description, :cost_price, :image_url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @product_code = options['product_code']
    @description = options['description']
    @cost_price = options['cost_price'].to_i
    # @supplier_id = options['supplier_id'].to_i
    # @category_id = options['category_id'].to_i
    @image_url = options['image_url']
  end

  def save()
    sql = "INSERT INTO products
    (name, product_code, description, cost_price, image_url)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @product_code, @description, @cost_price, @image_url]
    product = SqlRunner.run(sql, values).first
    @id = product['id'].to_i
  end

end
