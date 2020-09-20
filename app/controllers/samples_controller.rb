class SamplesController < ApplicationController

    def index
        @samples = Sample.all
    end

    def new
        @sample = Sample.new
    end

    def create
        @sample = Sample.new(sample_params)

        if @sample.save
            redirect_to sample_path(@sample)
        else
            render :new
        end
    end

    def show
        @sample = Sample.find(params[:id])
    end

    def edit 
        @sample = Sample.find(params[:id])
    end

    private

    def sample_params
        params.require(:sample).permit(:name, :Address, :institution, :phone_num, :email, :supervisor_name,
                                   :supervisor_contact, :referrer, :current_status, :required_service,
                                   :description, :perishable, :retention_time, :result_due_date)
    end
end
