class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)

    unless @reservation.valid?
      render "rooms/show"
      return
    end
  end

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:info] = "予約しました"
      redirect_to reservations_path
    else
      flash.now[:error] = "予約できませんでした"
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:info] = "再予約しました"
      redirect_to reservations_path
    else
      flash.now[:error] = "再予約できませんでした"
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy!
    flash[:info] = "予約を取り消しました"
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :member_count, :room_id).merge(user_id: current_user.id)
  end

end
