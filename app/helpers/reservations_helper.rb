module ReservationsHelper
  def total_fee(reservation)
  (reservation.check_out_date.to_date - reservation.check_in_date.to_date).to_i * reservation.room.fee * reservation.member_count
  end
end
