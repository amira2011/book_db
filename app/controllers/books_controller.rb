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
        if  @book.update(books_params)
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
        @book = Book.new(books_params)
        params[:book][:genre_ids].each do |genre|
            next if genre.empty?
            obj = Genre.find(genre)
            @book.genres << obj
        end
        params[:book][:author_ids].each do |author|
            next if author.empty?
            obj1 = Author.find(author)
            @book.authors << obj1
        end

        if @book.save 
            flash[:success]="Successfully Created"
          #  @data.push(@book.genres)
          #  @data.push(@book.authors)
          #  @data.push(@book)
            #Utils.post_data(@book.as_json)
          #  Utils.post_data(@data.as_json)
            redirect_to books_path
        else
            render 'new', status: :unprocessable_entity
        end  
     
    end

    private
    
     
    def books_params
        params.require(:book).permit(:title, :total_pages, :rating, :isbn , :published_date, :publisher_id  )
    end

end



