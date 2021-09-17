require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "secret"
      register Sinatra::Flash
    end 

   get "/" do
     
     erb :welcome
   end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(studypost)
      @study_post.user == current_user
    end 
    
    def redirect_if_not_logged_in
      if !logged_in?
          flash[:errors] = "You must be logged in to view the page you tried to view"
          redirect '/'
      end 
    end 
  
    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end 
    end 

    def partial(template, locals = {})
    slim template, :layout => false, :locals => locals
    end

  #the flash helper
   def flash
    @flash = session.delete(:flash)
    end
  end 
end
