class Room < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :fee, presence: true

  validate :check_fee_minimum

  scope :query, -> (q){
    return all if q.blank?

    where("name LIKE ?", "%#{sanitize_sql_like(q)}%")
      .or(where("address LIKE ?", "%#{sanitize_sql_like(q)}%"))
      .or(where("introduction LIKE ?", "%#{sanitize_sql_like(q)}%"))
  }

  def check_fee_minimum
    errors.add(:fee, "金額は1円以上に設定してください") if fee.nil? || fee < 1
  end

end
