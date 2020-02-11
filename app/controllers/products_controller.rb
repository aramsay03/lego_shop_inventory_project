require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative('../models/product.rb')
require_relative('../models/stock.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/products' do
  @products = Product.all()
  erb( :"product/index" )
end

# CREATE - NEW (GET) #
get "/products/new" do
  @categories = Category.all()
  @suppliers = Supplier.all()
  erb( :"product/new")
end

# CREATE - CREATE (POST) #
post "/products" do
  @product = Product.new(params)
  @product.save()
  params["product_id"] = @product.id
  @stock = Stock.new(params)
  @stock.save()
  redirect to "/products"
end

# READ - one/show (by id) (GET) #
get '/products/:id' do
  @product = Product.find(params[:id])
  erb( :"product/show" )
end

# UPDATE - (find by id (GET)) & (update (POST)) #
get '/products/:id/edit' do
  @product = Product.find(params[:id])
  @categories = Category.all()
  @suppliers = Supplier.all()
  erb( :"product/edit")
end

post '/products/:id' do
  @product = Product.new(params)
  @product.update()
  redirect to "/products"
end

# DELETE #
post '/products/:id/delete' do
  @product = Product.find(params[:id])
  @product.delete()
  redirect to "/products"
end
