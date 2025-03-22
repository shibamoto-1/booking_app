class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validate :greater_than_check_in
  validates :member_count, presence: true
  validate :member_count

  def greater_than_check_in
    if check_in_date.present? && check_out_date.present? && check_in_date >= check_out_date
      error.add("チェックアウト日はチェックイン日より後ろに設定してください", :check_out_date)
    end
  end

  def greater_than_zero_member_count
    if member_count.present? && member_count < 1
      error.add("人数は0より大きい値にしてください", :member_count)
    end
  end
end
