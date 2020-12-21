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
        @tag = Tag.find(params[:id])
        @genres = Genre.all
    end
    
    def update
        @tag = Tag.find(params[:id])
        if @tag.update(tag_params)
            flash[:notice] = "編集に成功しました"
            redirect_to admins_tags_path
        else
            flash[:notice] = "error"
        end
    end
    
    def destroy
        @tag = Tag.find(params[:id])
        if @tag.destroy
            flash[:notice] = "削除に成功しました"
            redirect_to admins_tags_path
        else
            flash[:notice] = "error"
        end
    end
    
    private
    def tag_params
        params.require(:tag).permit(:name, :introduction, :genre_id)
    end
end
