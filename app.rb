require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:end)
end 

get("/square/new") do
  erb(:new_square_calc)
end

get '/sqaure/results' do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get '/sqaure_root/results' do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get '/payment/results' do
  @the_APR = params.fetch("users_APR").to_f
  @the_APR = @the_APR/100
  @the_r = @the_APR/12
  @the_years = params.fetch("users_years").to_f
  @the_periods = @the_years * 12
  @the_principal = params.fetch("users_principal").to_currency
  @numerator = @the_principal * @the_r
  @denominator = 1 - (1+@the_r)**(-1*@the_periods)
  @the_result = @numerator/@denominator
  erb(:payment_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
