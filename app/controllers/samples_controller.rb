class SamplesController < ApplicationController

    def index
        @samples = Sample.all.order("created_at DESC")
        if params[:search]
            @search_term = params[:search]
            @samples = @samples.search_by(@search_term)
        end
    end

    def new
        @sample = Sample.new
    end

    def create
        @sample = Sample.new(sample_params)

        if @sample.save
            flash[:notice] = 'Sample Created sucessfully'
            redirect_to sample_path(@sample)
        else
            flash.now[:notice] = 'Sample can not be created for some reasons'
            render :new
        end
    end

    def show
        @sample = Sample.find(params[:id])
        session[:sample_id] = @sample.id
    end

    def edit 
        @sample = Sample.find(params[:id])
    end

    def update 
        @sample = Sample.find(params[:id])
        @sample.update(sample_params)

        if @sample.save
            flash[:notice] = 'Sample Updated sucessfully'
            redirect_to sample_path(@sample)
        else
            render :edit
        end
    end

    def destroy  
        @sample = Sample.find(params[:id])
    
        if @sample.destroy
          flash[:alert] = 'Sample deleted Successfully'
    
          redirect_to root_path
        else
          flash.now[:notice] = 'Sample can not be deleted for some reasons'
          render sample_path(@sample)
        end
      end    

    private

    def sample_params
        params.require(:sample).permit(:name, :Address, :institution, :phone_num, :email, :supervisor_name,
                                   :supervisor_contact, :referrer, :current_status, :required_service,
                                   :description, :perishable, :retention_time, :result_due_date)
    end
end
