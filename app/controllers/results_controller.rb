class ResultsController < ApplicationController
    
    def index 
        @results = Result.all
    end

    def new  
        @result = Result.new
    end

    def create 
        if @result.save
          flash[:notice] = "Result created sucessfully"
          redirect_to result_path
        else
          flash[:alert] = "Result was not created, for some reasons"
          render :new
        end
    end


    private 

    def result_params 
        params.require(:result).permit(:Tv, :Ws, :proteinrich, :Wsc,
                                     :Wca, :T, :DO5, :DO1, :DABSsample, :DABSstd)
    end
end
