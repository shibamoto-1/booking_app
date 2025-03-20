class Room < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :fee, presence: true

  validate :check_fee_minimum

  def check_fee_minimum
    errors.add(:fee, "金額は1円以上に設定してください") if fee.nil? || fee < 1
  end

end
