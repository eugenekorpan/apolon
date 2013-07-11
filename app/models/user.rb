class User < ActiveRecord::Base
  attr_accessible :age, :email, :first_name, :job_title, :last_name

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_many :books

  scope :find_by_full_name, ->(name) { where("first_name='#{name[0]}' AND last_name='#{name[1]}'") }

  def full_name
    [first_name, last_name].join(" ")
  end
end
