class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :department, default: -> { Department.find_by(id: 1) }
  # belongs_to :position, default: -> { Position.find_by(id: 1) }
       
  validates :name, presence: true
  # validates :department_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  # validates :position_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
       
  has_many :manuals
  has_many :comments
end
