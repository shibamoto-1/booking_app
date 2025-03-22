class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :rooms, through: :reservations
  has_many :reservations, dependent: :destroy
  before_destroy :destroy_rooms

  private
  def destroy_rooms
    rooms.destroy_all
  end
  
end
