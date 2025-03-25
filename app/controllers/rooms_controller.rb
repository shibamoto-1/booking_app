class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:own, :new, :edit, :update, :destroy, :create]

  def search
  end

  def index
    @rooms = Room.area_query(params[:area_q]).room_query(params[:room_q])
  end

  def own
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:info] = "作成しました！"
      redirect_to room_path(@room.id)
    else
      flash.now[:error] = "失敗しました"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:info] = "更新しました"
      redirect_to room_path(@room.id)
    else
      flash.now[:error] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy!
    flash[:info] = "施設情報を削除しました"
    redirect_to rooms_path, status: :see_other
  end

  private
  def room_params
    params.require(:room).permit(:name, :image, :introduction, :address, :fee).merge(user_id: current_user.id)
  end
end
