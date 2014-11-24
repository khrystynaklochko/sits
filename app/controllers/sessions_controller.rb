class SessionsController < ApplicationController
  def new
  end
  
  def create
    operator = Operator.find_by_email(params[:session][:email])
    puts operator
    if operator && operator.authenticate(params[:session][:password])
      session[:operator_id] = operator.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new", :notice => "Email or password is invalid"
    end
  end
  
  def destroy
    session[:operator_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end