class StudyPostsController < ApplicationController

    get '/study_posts' do 
        @study_posts = StudyPost.all
        erb :'/study_posts/index'
    end 

    get '/study_posts/new' do
        erb :'/study_posts/new'
    end

    post '/study_posts' do 
        
        if params[:description] != "" && params[:study_time] != "" && params[:date] != ""
             @study_post = StudyPost.create(description: params[:description], u_name: current_user.name, user_id: current_user.id, date: params[:date], study_time: params[:study_time])
            redirect "/study_posts/#{@study_post.id}"
          else
            flash[:errors] = "Something went wrong - you must provide Description, Study Time and Date."
            redirect '/study_posts/new'
          end
        binding.pry
    end 

    get '/study_posts/:id' do
        set_study_post
        erb :'study_posts/show' 
    end 

    get '/study_posts/:id/edit' do 
        set_study_post
        erb :'/study_posts/edit'
    end 

    patch '/study_posts/:id' do 
        set_study_post
        if @study_post.user == current_user && params[:description] != "" && params[:date] != "" && params[:study_time] != ""
           @study_post.update(description: params[:description], date: params[:date], study_time: params[:study_time])
            redirect "/study_posts/#{@study_post.id}"
        else 
            redirect "users/#{current_user.id}"
        end 
    end 

    delete '/study_posts/:id' do 
        set_study_post
        if authorized_to_edit?(@study_post)
            @study_post.destroy 
            flash[:message] = "Successfully delete that post"
            redirect '/study_posts'
        else 
            redirect 'journal_entries'
        end 
    end 

    private

    def set_study_post
        @study_post = StudyPost.find(params[:id])
    end 

end 

