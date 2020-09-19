class SamplesController < ApplicationController

    def index
        @samples = Sample.all
    end

    def new
        @sample = Sample.new
    end

    def create
        @sample = Sample.new(smaple_params)

        if @sample.save
            redirect_to sample_path(@sample)
        else
            render :new
        end
    end

    def show
        @sample = Sample.find(params[:id])
    end
end
