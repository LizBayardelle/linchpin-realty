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

  has_and_belongs_to_many(:users,
    :join_table => "team_assignments",
    :foreign_key => "team_id",
    :association_foreign_key => "client_id")


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
