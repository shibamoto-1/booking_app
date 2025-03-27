class User < ApplicationRecord
  before_create :default_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
  has_many :rooms
  before_destroy :destroy_rooms
  has_one_attached :avater
  
  private
  def default_image
    if !self.avater.attached?
      self.avater.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avater.png')),
      filename: 'default_avater.png',
      content_type: 'image/png')
    end
  end

  def destroy_rooms
    rooms.destroy_all
  end
  
end
