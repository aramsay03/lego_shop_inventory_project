require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/supplier.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/suppliers' do
  @suppliers = Supplier.all()
  erb( :"supplier/index" )
end

# CREATE - NEW (GET) #
get '/suppliers/new' do
  erb( :"supplier/new")
end

post '/suppliers' do
  @supplier = Supplier.new(params)
  @supplier.save()
  redirect to "/suppliers"
end

# CREATE - CREATE (POST) #

# READ - one/show (by id) (GET) #

# UPDATE - (find by id (GET)) & (update (POST)) #

# DELETE #
