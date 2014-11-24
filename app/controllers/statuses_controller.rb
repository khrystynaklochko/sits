class StatusesController < ApplicationController
  before_action :authorize

  def index
    @statuses = Status.all

    respond_to do |format|
      format.html
      format.json { render json: @statuses }
    end
  end

  def new
    @status = Status.new

    respond_to do |format|
      format.html
      format.json { render json: @status }
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def create
    @status = Status.new(params[:status])

    respond_to do |format|
      if @status.save
        format.html { redirect_to statuses_url, notice: 'Status was successfully created.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to statuses_url, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end
  end
end
