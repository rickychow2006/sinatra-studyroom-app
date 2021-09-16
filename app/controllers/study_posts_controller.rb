class StudyPostsController < ApplicationController

    get '/study_posts' do 
        @study_posts = StudyPost.all
        erb :'/study_posts/index'
    end 

    get '/study_posts/new' do
        erb :'/study_posts/new'
    end

    post '/study_posts' do 
        
        if params[:description] != ""
            @study_post = StudyPost.create(description: params[:description], u_name: current_user.name, user_id: current_user.id, date: params[:date], study_time: params[:study_time])
            redirect "/study_posts/#{@study_post.id}"
          else
            flash[:errors] = "Something went wrong - you must provide content for your entry."
            redirect '/study_posts/new'
            binding.pry

          end
    end 

    get '/study_posts/:id' do
        set_study_post
        erb :'study_posts/show' 
    end 

    def set_study_post
        @study_post = StudyPost.find(params[:id])
    end 


end 

