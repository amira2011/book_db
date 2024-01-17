class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def delete
        
    end

    def show
        @genre = Genre.find(params[:id])
        @books = @genre.books
    end
    
    
    def destroy
        @genre = Genre.find(params[:id])
        if  @genre.destroy
            redirect_to genres_path
        end
    end
end
