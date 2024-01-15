class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def edit
        @book= Book.find(params[:id])
    end

    def update
        @book= Book.find(params[:id])
        if  @book.update(books_params1)
            redirect_to books_path
        else 
            render 'edit'
        end
    
    end

    def delete
    
    
    end
    
    
    def destroy
        @book= Book.find(params[:id])
        if   @book.destroy
            redirect_to books_path
        end
    
    end

    def create
        puts params.inspect
        @genre= Genre.find(params[:genre].to_i)
        @author= Author.find(params[:author].to_i)
        @publisher= Publisher.find(params[:publisher].to_i)
        @book = Book.new()
        @book.title= params[:title] 
        @book.total_pages= params[:total_pages]
        @book.rating= params[:rating]
        @book.isbn= params[:isbn]
        @book.published_date= params[:published_date]
        @book.publisher_id= @publisher.id 

        if @book.save 
            flash[:success]="Successfully Created"
            @book.authors << @author
            @book.genres << @genre
            Utils.post_data(@book.as_json, @author.as_json, @genre.as_json)
            redirect_to books_path
        else
            render 'new', status: :unprocessable_entity
        end  
     
    end

    private
    
    def books_params
        params.require(:book).permit(:title, :total_pages, :rating, :isbn , :published_date, :publisher,  :genre, :author )
    end

    def books_params1
        params.require(:book).permit(:title, :total_pages, :rating, :isbn , :published_date, :publisher  )
    end

end



