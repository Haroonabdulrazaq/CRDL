class ResultsController < ApplicationController

    def index 
        @results = Result.all
    end

    def new  
        @result = Result.new
    end

    def create
        @result = Result.new(result_params)
        @result[:sample_id] = session[:sample_id]
        if @result.save
          flash[:notice] = "Result created sucessfully"
          redirect_to result_path(@result)
        else
          flash[:alert] = "Result was not created, for some reasons"
          render :new
        end
    end

    def show 
        @result = Result.find(params[:id])               
        @result_calc = ResultCal.new(@result)
        @protein = @result_calc.protein
        @moisture = @result_calc.moisturize
        @turbidity = @result_calc.Turbidity
        @color = @result_calc.Color
        @bod = @result_calc.BOD
        @creatinine = @result_calc.Creatinine
    end

    private 

    def result_params 
        params.require(:result).permit(:Tv, :Ws, :proteinrich, :Wsc,
                                     :Wca,:Abs ,:T, :DO5, :DO1, :DABSsample, :DABSstd)
    end
end
