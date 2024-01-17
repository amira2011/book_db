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

    def edit
        @genre = Genre.find(params[:id])
    end
    
    
    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            redirect_to genre_path(@genre)
        else 
            render 'edit'
        end
    end



    def new
        @genre  = Genre.new
    end

    def create
        @genre  = Genre.new(genre_params)
        if  @genre.save 
            flash[:success]="Successfully Created"
            redirect_to genres_path
        else
            render 'new', status: :unprocessable_entity
        end   
    end

    private

    def genre_params
        params.require(:genre).permit(:genre_name)
    end

end
