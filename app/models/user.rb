class User < ApplicationRecord

  has_many :tickets
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :student_division
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end