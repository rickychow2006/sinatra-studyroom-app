class UserController < ApplicationController
    
    get '/login' do
        redirect_if_logged_in
        erb :login
    end

    post '/login'  do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            flash[:message] = 'Welcome, #{@user.name}!'
            redirect "users/#{@user.id}"
        else 
            falsh[:errors] = 'Sorry the credentials you are using are invalid. Please update your credentials and try again.'
            redirect '/login'
        end 
    end

    get '/signup' do
        redirect_if_logged_in
        erb :signup
    end 

    post '/users' do 
        @user = User.create(params)
        if @user.save 
            session[:user_id] = @user.id
            flash[:message] = 'You have successfuly created an account! Welcome, #{@user.name} to the Study Room Community!'
            redirect "/users/#{@user.id}"
        else
            flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
            redirect '/signup'
        end 
    end 

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        redirect_if_not_logged_in

        erb :'/users/show'
    end 

    get '/logout' do
        session.clear 
        redirect '/'

    end 

end 