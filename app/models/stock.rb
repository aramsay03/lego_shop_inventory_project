require_relative('../db/sql_runner')

class Stock

  attr_reader :id, :product_id, :retail_price, :stock_qty

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @product_id = options['product_id'].to_i
    @retail_price = options['retail_price'].to_i
    @stock_qty = options['stock_qty'].to_i
  end

  def save()
    sql = "INSERT INTO stock
    (product_id, retail_price, stock_qty)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@product_id, @retail_price, @stock_qty]
    stock = SqlRunner.run(sql, values).first
    @id = stock['id'].to_i
  end

end
