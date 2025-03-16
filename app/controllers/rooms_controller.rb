class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def search
  end

  def new
    @room = Room.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :image, :introduction, :address, :fee).merge(user_id: current_user.id)
  end
end
