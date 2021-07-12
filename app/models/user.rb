class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :histories, dependent: :destroy
  has_many :resumes, dependent: :destroy
  has_many :advantages, dependent: :destroy
end
