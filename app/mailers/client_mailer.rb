class ClientMailer < ActionMailer::Base
  default :from => "khrystynaklochko@gmail.com"

  def new_ticket(ticket, host)
    @host = host
    @ticket = ticket
    @version = @ticket.last_type

    mail(to: @ticket.email, subject: "You created new ticked")
  end

  def new_version(version, host)
    @host = host
    @version = version
    @ticket = @version.ticket

    mail(to: @ticket.email, subject: "Your ticked was updated")
  end
end
