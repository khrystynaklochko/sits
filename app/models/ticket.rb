class Ticket < ActiveRecord::Base
  has_many :tickets_types 
  attr_accessible :email, :key, :username, :tickets_types_attributes, :tickets_types_ids, 
                  :created_at, :last_update, :last_version, :subject, :status, :department, :operator, :description
  
  accepts_nested_attributes_for :tickets_types,  allow_destroy: true
  validates :email, presence: true, 
                    length: { minimum: 3, maximum: 50}
                    
  validates :key, presence: true, 
                  uniqueness: true

  scope :sp_from_email,   lambda { |i| where('email = ?', i )                                   unless i.blank? }
  scope :sp_by_id_or_key, lambda { |i| where(arel_table[:id].eq(i).or(arel_table[:key].eq(i)))  unless i.blank? }
  scope :sp_departments,  lambda { |i| where('tickets_types.department_id IN (?) ', i)       unless i.blank? }
  scope :sp_statuses,     lambda { |i| where('tickets_types.status_id IN (?)', i)            unless i.blank? }
  scope :sp_query,        lambda { |q| 
    where("tickets_types.subject ilike ? or tickets_types.description ilike ?", "%#{q}%", "%#{q}%") unless q.blank? 
  }
  scope :sp_assigned_to,  lambda { |ids, null| 
    params = if ids && null
      ['tickets_types.operator_id IN (?) AND tickets_types.operator_id IS NULL', ids]
    elsif ids
      ['tickets_types.operator_id IN (?)', ids]
    elsif null
      'tickets_types.operator_id IS NULL'
    end
    where(params) if params
  }

  before_validation(on: :create) do
    write_attribute( :key, get_uniq_key )
  end

  def self.search(params)
    operators = params[:operator] && params[:operator].map(&:split).flatten

    joins(:tickets_versions).
    sp_assigned_to(operators, params[:not_assigned]).
    sp_departments(params[:department]).
    sp_statuses(params[:status]).
    sp_query(params[:query]).
    uniq
  end

  # virtual attrs
  def last_update
    last_version.updated_at
  end

  def last_version
    tickets_types.last
  end

  def subject
    last_version.subject
  end

  def description
    last_version.description
  end

  def status
    last_version.status && last_version.status.title
  end

  def department
    last_version.department && last_version.department.name
  end

  def operator
    last_version.operator && last_version.operator.name
  end

  private

  def get_uniq_key
    loop do
      uniq_key = "#{('A'..'Z').to_a.sample(3).join}-#{rand(10**6).to_s(10)}"
      return uniq_key unless self.class.find_by_key(uniq_key)
    end
  end
end
