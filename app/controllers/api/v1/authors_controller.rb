module Api
  module V1
    class AuthorsController < ApiBaseController
      before_action :set_author, only: [:show, :update, :destroy]

      def index
        authors = Author.all
        render json: authors, status: :ok
      end

      # Show details of a specific author
      def show
        render json: @author, status: :ok
      end

      # Create a new author
      def create
        author = Author.new(author_params)
        if author.save
          render json: author, status: :created
        else
          render json: { errors: author.errors }, status: :unprocessable_entity
        end
      end

      # Update an existing author
      def update
        puts "author_params before update: #{author_params.inspect}"
        if @author.update(author_params)
          render json: @author, status: :ok
        else
          render json: { errors: @author.errors }, status: :unprocessable_entity
        end
      end

      # Delete an existing author
      def destroy
        if @author.destroy
          render json: { message: "Deleted Author" }, status: :no_content
        else
          render json: { errors: "Failed to delete author" }, status: :unprocessable_entity
        end
      end

      private

      # Set the author based on the :id parameter for show, update, and destroy actions
      def set_author
        @author = Author.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: "Author not found" }, status: :not_found
      end

      # Define permitted parameters for creating and updating authors
      def author_params
        params.require(:author).permit(:first_name, :middle_name, :last_name)
      end
    end
  end
end
