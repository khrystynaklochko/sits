class TicketsType < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :department
  belongs_to :status
  belongs_to :operator
  attr_accessible :description, :from, :subject, :operator_id, :status_id, :department_id, :ticket_id, :updated_at
  
  validates :from,  presence: true,
                    inclusion: { in: ['client', 'operator'] }
end
