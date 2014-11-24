class OperatorsController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def index
    @operators = Operator.all

    respond_to do |format|
      format.html
      format.json { render json: @operators }
    end
  end

  def new
    @operator = Operator.new

    respond_to do |format|
      format.html
      format.json { render json: @operator }
    end
  end

  def edit
    @operator = Operator.find(params[:id])
  end

  def create
    @operator = Operator.new(params[:operator])

    respond_to do |format|
      if @operator.save
        format.html { redirect_to operators_url, notice: 'Operator was successfully created.' }
        format.json { render json: @operator, status: :created, location: @operator }
      else
        format.html { render action: "new" }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @operator = Operator.find(params[:id])

    respond_to do |format|
      if @operator.update_attributes(params[:operator])
        format.html { redirect_to operators_url, notice: 'Operator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @operator = Operator.find(params[:id])
    @operator.destroy

    respond_to do |format|
      format.html { redirect_to operators_url }
      format.json { head :no_content }
    end
  end
end
