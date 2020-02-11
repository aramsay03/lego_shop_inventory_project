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

  # UPDATE
  def update()
    sql = "UPDATE stock SET
    (product_id, retail_price, stock_qty)
    =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@product_id, @retail_price, @stock_qty, @id]
    SqlRunner.run(sql, values)
  end

  # DETETE
  def delete()
    sql = "DELETE FROM stock WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # FIND PRODUCT ID
  def product()
    sql = "SELECT * FROM products WHERE id = $1"
    values = [@product_id]
    results = SqlRunner.run(sql, values)
    return Product.new(results.first)
  end

  # STOCK QTY STATUS
  def stock_qty_status()
    if @stock_qty <= 5 && @stock_qty > 0
      return "Stock Low"
    elsif @stock_qty == 0
      return "Out of Stock"
    elsif @stock_qty < 0
      return "Orders to fifill"
    else
      return "Stock Quantity Good"
    end
  end

  # FIND
  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    stock = SqlRunner.run(sql, values)
    result = Stock.new(stock.first)
    return result
  end

  # SELF.ALL
  def self.all()
    sql = "SELECT * FROM stock"
    stock = SqlRunner.run(sql)
    result = stock.map{ |stock| Stock.new(stock)}
    return result
  end

  # SELF.DETETE_ALL
  def self.delete_all
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end

end
