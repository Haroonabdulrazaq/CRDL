# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @sample = Sample.find_by(@result.sample_id)
    @results = Result.all
  end

  def new
    @result = Result.new
    @sample = Sample.find_by_id(params[:sample_id])
  end

  def create
    @sample = Sample.find_by_id(params[:sample_id])
    @result = @sample.results.new(result_params)
    # @result = Result.new(result_params)
    if @result.save
      flash[:notice] = 'Result created sucessfully'
      redirect_to sample_result_path(@result.sample_id, @result)
    else
      flash[:alert] = 'Result was not created, for some reasons'
      render :new
    end
  end

  def edit
    @result = Result.find(params[:id])
    @sample = Sample.find_by_id(params[:sample_id])
  end

  def update
    @result = Result.find(params[:id])
    @result.update(result_params)

    if @result.save
      flash[:notice] = 'Result Updated sucessfully'
      redirect_to sample_result_path(@result)
    else
      render :edit
    end
  end

  def show
    @result = Result.find(params[:id])
    @sample = @result.sample_id
    @result_calc = ResultCal.new(@result)
    @protein = @result_calc.protein
    @moisture = @result_calc.moisturize
    @turbidity = @result_calc.Turbidity
    @color = @result_calc.Color
    @bod = @result_calc.BOD
    @creatinine = @result_calc.Creatinine
    @saponification = @result_calc.Saponification
    @acid_value = @result_calc.Acid_value
    @fatty_acid = @result_calc.Fatty_acid
    @iodine_value = @result_calc.Iodine_value
    @polenske_value = @result_calc.Polenske_value
  end


  def destroy
    @result = Result.find(params[:id])

    if @result.destroy
      flash[:alert] = 'Result deleted Successfully'

      redirect_to root_path
    else
      flash.now[:notice] = 'Result can not be deleted for some reasons'
      render sample_result_path(@result)
    end
  end

  private

  def result_params
    params.require(:result).permit(:Tv, :Ws, :proteinrich, :Wsc,
                                   :Wca, :Abs, :T, :DO5, :DO1, :DABSsample, :DABSstd,
                                   :Bsap, :Ssap, :Nsap, :Wsap, :Va, :Na, :Wa, :bi,
                                   :Si, :Ni, :Wi, :Vp, :Np)
  end
end
