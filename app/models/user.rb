class User < ApplicationRecord
  validates :username, presence: true  # もしくは、presence: { allow_nil: true } など
  validates :profile, presence: true  # もしくは、presence: { allow_nil: true } など
  validates :occupation, presence: true  # もしくは、presence: { allow_nil: true } など
  validates :position, presence: true  # もしくは、presence: { allow_nil: true } など

  has_many :prototypes
  has_one_attached :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
