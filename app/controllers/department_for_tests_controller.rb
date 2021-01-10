# frozen_string_literal: true

class DepartmentForTestsController < ApplicationController
  before_action :set_department_for_test, only: %i[show edit update destroy]

  # GET /department_for_tests
  # GET /department_for_tests.json
  def index
    @department_for_tests = DepartmentForTest.all
  end

  # GET /department_for_tests/1
  # GET /department_for_tests/1.json
  def show; end

  # GET /department_for_tests/new
  def new
    @department_for_test = DepartmentForTest.new
  end

  # GET /department_for_tests/1/edit
  def edit; end

  # POST /department_for_tests
  # POST /department_for_tests.json
  def create
    @department_for_test = DepartmentForTest.new(department_for_test_params)

    respond_to do |format|
      if @department_for_test.save
        format.html { redirect_to @department_for_test, notice: 'Department for test was successfully created.' }
        format.json { render :show, status: :created, location: @department_for_test }
      else
        format.html { render :new }
        format.json { render json: @department_for_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department_for_tests/1
  # PATCH/PUT /department_for_tests/1.json
  def update
    respond_to do |format|
      if @department_for_test.update(department_for_test_params)
        format.html { redirect_to @department_for_test, notice: 'Department for test was successfully updated.' }
        format.json { render :show, status: :ok, location: @department_for_test }
      else
        format.html { render :edit }
        format.json { render json: @department_for_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_for_tests/1
  # DELETE /department_for_tests/1.json
  def destroy
    @department_for_test.destroy
    respond_to do |format|
      format.html { redirect_to department_for_tests_url, notice: 'Department for test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_department_for_test
    @department_for_test = DepartmentForTest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def department_for_test_params
    params.require(:department_for_test).permit(:title, :description, :user_id)
  end
end
