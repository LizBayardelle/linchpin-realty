class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_update :reset_confirmed
  has_many :comments
  has_many :blogs
  has_many :values
  has_many :loans
  has_many :documents
  
  def reset_confirmed
    self.update_column(:status_confirmed, false) if self.buyer_changed? || self.seller_changed?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def last_first
    "#{last_name}, #{first_name}"
  end


end
