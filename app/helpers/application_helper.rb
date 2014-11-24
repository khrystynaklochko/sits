module ApplicationHelper

  def from_title(version)
    if version.from == 'operator'
      "Operator: #{version.operator && version.operator.name}"
    else
      "Client: #{version.ticket.email}"
    end
  end

end
