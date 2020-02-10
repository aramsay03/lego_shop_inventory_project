require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/stock.rb')
require_relative('../models/product.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/stock' do
  @products = Product.all()
  @stock = Stock.all()
  erb( :"stock/index" )
end

# CREATE - NEW (GET) #

# CREATE - CREATE (POST) #

# READ - one/show (by id) (GET) #

# UPDATE - (find by id (GET)) & (update (POST)) #

# DELETE #
