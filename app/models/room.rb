class Room < ApplicationRecord
  before_create :default_image

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :fee, presence: true

  validate :check_fee_minimum

  scope :area_query, -> (q){
    return all if q.blank?
    where("address LIKE ?", "%#{sanitize_sql_like(q)}%")
  }
  scope :room_query, -> (q){
    return all if q.blank?

    where("name LIKE ?", "%#{sanitize_sql_like(q)}%")
      .or(where("introduction LIKE ?", "%#{sanitize_sql_like(q)}%"))
  }

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'room_image.png')),
      filename: 'room_image.png',
      content_type: 'image/png')
    end
  end

  def check_fee_minimum
    errors.add(:fee, "金額は1円以上に設定してください") if fee.nil? || fee < 1
  end

end
