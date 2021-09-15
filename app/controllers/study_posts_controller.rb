class StudyPostsController < ApplicationController

    get '/studyposts' do 
        erb :'/study_posts/show'
    end 

    get '/studyposts/new' do
        erb :'/study_posts/new'
    end

    post '/studyposts' do 
        if !logged_in?
            redirect '/'
        end 
    end 
end 
