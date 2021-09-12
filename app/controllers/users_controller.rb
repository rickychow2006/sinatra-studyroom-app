class UserController < ApplicationController
    
    get '/login' do
        erb :login
        
    end

    post '/login'  do

        @user = User.find(email: params[:email])

        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect 'users/#{@user.id}'
        end 
    end

    get '/signup' do
        erb :signup
    end 

    post '/users' do 
        if params[:name] != "" && params[:email] !="" && params[:password] != ""
            @user = User.create(params)
            redirect '/users/#{@user.id}'
        else
            redirect '/signup'

        end 

    end 


    get '/users/:slug' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end 

    get '/logout' do
        session.clear 
        redirect '/'

    end 
    
    helpers do 

        def logged_in?
            !!current_user
        end 
        
        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end 
    end 

end 