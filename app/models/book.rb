class Book < ActiveRecord::Base
  attr_accessible :title, :user_id

  belongs_to :user

  def user_name
    user.full_name if user
  end
end
