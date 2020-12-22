class Admins::GenresController < ApplicationController
    
    def index
        @genre = Genre.new
        @genres = Genre.all
        
    end
    
    def create
      @genre = Genre.new(genre_params)
      if @genre.save
        flash[:notice] = '投稿に成功しました'
        redirect_to admins_genres_path
      else
        flash[:notice] = 'error'
        redirect_to admins_genres_path
      end
    end
    
    def edit
      @genre = Genre.find(params[:id])
    end
    
    def update
      @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
        flash[:notice] = '編集に成功しました'
        redirect_to admins_genres_path
      else
        flash[:notice] = 'error'
        redirect_to admins_genres_path
      end
    end
    
    def destroy
      @genre = Genre.find(params[:id])
      if @genre.destroy
      flash[:notice] = '削除しました'
      redirect_to admins_genres_path
      else
      flash[:notice] = 'error'
      redirect_to admins_genres_path
      end
    end
    
    private
    def genre_params
        params.require(:genre).permit(:name, :introduction, :is_active)
    end
    
end
