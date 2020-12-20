class Admins::TagsController < ApplicationController
    
    def index
        @tag = Tag.new
        @tags = Tag.all
        @genres = Genre.all
    end
    
    def create
        @tag = Tag.new(tag_params)
        @genres = Genre.all
        @genres.each do |genre|
            @tag.genre_id = genre.id
        end
        if @tag.save
            flash[:notice] = 'タグの投稿に成功しました'
            redirect_to admins_tags_path
        else
            flash[:notice] = 'error'
            redirect_to admins_tags_path
        end
    end
    
    def edit
    
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    def tag_params
        params.require(:tag).permit(:name, :introduction, :genre_id)
    end
end
