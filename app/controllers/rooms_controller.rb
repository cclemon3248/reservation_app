class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
  
  def search
    @rooms = @q.result
  end

  def post
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    # return render :new if @room.invalid?
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to room_path(@room.id)
    else
      return render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reserve = Reserve.new
  end

  private

  def room_params
    params.require(:room).permit(:name, :content, :price, :address, :image)
  end
end
