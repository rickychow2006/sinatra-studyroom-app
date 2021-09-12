class UserController < ApplicationController
    
    get '/login' do
        erb :login
        
    end

    post '/login'  do

        @user = User.find_by(email: params[:email])

        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect 'users/#{@user.id}'
        end 
    end

    get '/signup' do
    
    end 

    get '/users/:id' do
        "this will be the user show route"
    end

end 