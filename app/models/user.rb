class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_create :generate_authentication_token
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Gravtastic
  gravtastic

  

  has_many :places, :dependent => :destroy

  has_many :reservations

  has_many :reviews

  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
  end

end
