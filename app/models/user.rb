class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Gravtastic
  gravtastic

  

  has_many :places, :dependent => :destroy

  has_many :reservations

  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
  end

end
