require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/product.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/products/' do
  @products = Product.all()
  erb( :"product/index" )
end

# CREATE - NEW (GET) #

# CREATE - CREATE (POST) #

# READ - one/show (by id) (GET) #

# UPDATE - (find by id (GET)) & (update (POST)) #

# DELETE #
