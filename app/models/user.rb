class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy
  has_many :resources, dependent: :destroy
  has_many :startups, dependent: :destroy

  def password_required?
    super && provider.blank?
  end

end