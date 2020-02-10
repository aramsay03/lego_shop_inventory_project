require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/category.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/categories' do
  @categories = Category.all()
  erb( :"category/index" )
end

# CREATE - NEW (GET) #

# CREATE - CREATE (POST) #

# READ - one/show (by id) (GET) #

# UPDATE - (find by id (GET)) & (update (POST)) #

# DELETE #
