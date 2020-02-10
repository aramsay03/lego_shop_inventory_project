require_relative('../db/sql_runner')

class Supplier

  attr_reader :id, :company_name, :address, :telephone, :email, :web_address, :sales_contact, :notes

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @company_name = options['company_name']
    @address = options['address']
    @telephone = options['telephone']
    @email = options['email']
    @web_address = options['web_address']
    @sales_contact = options['sales_contact']
    @notes = options['notes']
  end

  def save()
    sql = "INSERT INTO suppliers
    (company_name, address, telephone, email, web_address, sales_contact, notes)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id"
    values = [@company_name, @address, @telephone, @email, @web_address, @sales_contact, @notes]
    supplier = SqlRunner.run(sql, values).first
    @id = supplier['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers SET
    (company_name, address, telephone, email, web_address, sales_contact, notes)
    =
    ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@company_name, @address, @telephone, @email, @web_address, @sales_contact, @notes]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT FROM suppliers WHERE id = $1"
    values = [id]
    supplier = SqlRunner.new(sql, values)
    result = Supplier.new(supplier.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    suppliers = SqlRunner.run(sql)
    result = suppliers.map{ |supplier| Supplier.new(supplier)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM suppliers"
    SqlRunner.run(sql)
  end
end
