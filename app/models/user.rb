class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :logs
  belongs_to :company
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessor :session_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  

  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end