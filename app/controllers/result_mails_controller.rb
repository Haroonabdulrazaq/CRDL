class ResultMailsController < ApplicationController
  before_action :set_result_mail, only: [:show, :edit, :update, :destroy]

  # GET /result_mails
  # GET /result_mails.json
  def index
    @result_mails = ResultMail.all
  end

  # GET /result_mails/1
  # GET /result_mails/1.json
  def show
  end

  # GET /result_mails/new
  def new
    @result_mail = ResultMail.new
  end

  # GET /result_mails/1/edit
  def edit
  end

  # POST /result_mails
  # POST /result_mails.json
  def create
    @result_mail = ResultMail.new(result_mail_params)

    respond_to do |format|
      if @result_mail.save
        format.html { redirect_to @result_mail, notice: 'Result mail was successfully created.' }
        format.json { render :show, status: :created, location: @result_mail }
      else
        format.html { render :new }
        format.json { render json: @result_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_mails/1
  # PATCH/PUT /result_mails/1.json
  def update
    respond_to do |format|
      if @result_mail.update(result_mail_params)
        format.html { redirect_to @result_mail, notice: 'Result mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_mail }
      else
        format.html { render :edit }
        format.json { render json: @result_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_mails/1
  # DELETE /result_mails/1.json
  def destroy
    @result_mail.destroy
    respond_to do |format|
      format.html { redirect_to result_mails_url, notice: 'Result mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_mail
      @result_mail = ResultMail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_mail_params
      params.require(:result_mail).permit(:recipient_email, :email_object, :email_message, :user_id)
    end
end
