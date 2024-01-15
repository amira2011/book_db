class PublishersController < ApplicationController
    def index
        @publishers = Publisher.all
    end

    def new
        @publisher = Publisher.new

    end


    def show
        @publisher= Publisher.find(params[:id])
    end
    
    
    def edit
        @publisher= Publisher.find(params[:id])
    end
    
    
    def update
        @publisher= Publisher.find(params[:id])
        if @publisher.update(publisher_params)
            redirect_to publisher_path(@publisher)
        else 
            render 'edit'
        end
    
    end
    
    
    def delete
    
    
    end
    
    
    def destroy
        @publisher= Publisher.find(params[:id])
        if  @publisher.destroy
            redirect_to publishers_path
        end
    
    end


    def create
        @publisher = Publisher.new(publisher_params)
        if @publisher.save 
            flash[:success]="Successfully Created"
            redirect_to publishers_path
        else
            render 'new', status: :unprocessable_entity
        end   
    end

    private

    def publisher_params
        params.require(:publisher).permit(:name)
    end

end
