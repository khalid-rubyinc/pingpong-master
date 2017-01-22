class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :scores

  def name
    email.split('@').first.capitalize
  end
end
