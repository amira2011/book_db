class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def new
    @author = Author.new
  end

  def delete
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      redirect_to authors_path
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render "edit"
    end
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Successfully Created"
      redirect_to authors_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :middle_name, :last_name)
  end
end
