class TicketsTypesController < ApplicationController

  def new
    @tickets_type = TicketsType.new
    respond_to do |format|
      format.html
      format.json { render json: @tickets_type }
    end
  end

  # POST /tickets_types
  def create
    @tickets_type = TicketsType.new(params[:tickets_type])
    
    respond_to do |format|
      if @tickets_type.save
        begin
          ClientMailer.new_version(@tickets_type, request.host_with_port).deliver if @tickets_type.from == 'operator'
        rescue
          mes = 'Without mail notification.'
        end
        format.html { redirect_to @tickets_type.ticket, notice: "Tickets version was successfully created. #{mes}" }
        format.json { render json: @tickets_type, status: :created, location: @tickets_type }
      else
        format.html { render action: "new" }
        format.json { render json: @tickets_type.errors, status: :unprocessable_entity }
      end
    end
  end
end
