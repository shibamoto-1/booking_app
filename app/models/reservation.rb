class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validate :check_in_greater_than_today
  validates :check_out_date, presence: true
  validate :greater_than_check_in
  validates :member_count, presence: true
  validate :greater_than_zero_member_count

  def check_in_greater_than_today
    if check_in_date.present? && check_in_date < Date.today
      errors.add(:check_in_date, "は本日以降の日付で選択して下さい")
    end
  end

  def greater_than_check_in
    if check_in_date.present? && check_out_date.present? && check_in_date >= check_out_date
      errors.add(:check_out_date, "はチェックイン日より後ろに設定してください")
    end
  end

  def greater_than_zero_member_count
    if member_count.present? && member_count < 1
      errors.add(:member_count, "は0より大きい値にしてください")
    end
  end
end
