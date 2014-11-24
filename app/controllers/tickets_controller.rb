class TicketsController < ApplicationController
  before_action :authorize, except: [:new, :create, :show]

  def index
    @tickets = Ticket.search(params)
    @filter = {
      operator: {
        me_id: current_user.id,
        other: (Operator.select(:id).map(&:id) - [current_user.id]).join(',')
      }
    }

    respond_to do |format|
      format.html 
      format.json { render json: @tickets }
    end
  end

  def show
    @ticket = Ticket.sp_by_id_or_key(params[:id]).first
    @related = Ticket.sp_from_email(@ticket.email)
    @tickets_version = @ticket.last_version.dup

    respond_to do |format|
      format.html
      format.json { render json: @ticket }
    end
  end

  def new
    @ticket = Ticket.new
    @ticket.tickets_types.build

    respond_to do |format|
      format.html 
      format.json { render json: @ticket }
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        begin  
          ClientMailer.new_ticket(@ticket, request.host_with_port).deliver
        rescue
          mes = 'Without mail notification.'
        end
        format.html { redirect_to @ticket, notice: "Ticket was successfully created. #{mes}" }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

end
