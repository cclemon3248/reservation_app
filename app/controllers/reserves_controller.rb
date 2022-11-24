class ReservesController < ApplicationController
  def index
    @reserves = Reserve.all
  end

  def new
    @room = Room.find(params[:room_id])
    @reserve = Reserve.new(reserve_params)
    if (params[:reserve][:start] == "") || (params[:reserve][:end] == "") || (params[:reserve][:people] == "")
      flash[:alert] = "人数は必須です"
      redirect_to request.referrer
    elsif @reserve.end < Date.today
      flash[:alert] = "過去の日付は無効です"
      redirect_to request.referrer
    elsif params[:reserve][:start] > params[:reserve][:end]
      flash[:alert] = "終了日は開始日より後にしてください"
      redirect_to request.referrer
    end

  end

  def create
    @room = Room.find(params[:room_id])
    @reserve = Reserve.new(reserve_params)
    @reserve.room_id = @room.id
    @reserve.people = params[:people]
    @reserve.save
    flash[:notice] = "Reservation was successfully created."
    redirect_to reserf_path(@reserve.id)
  end

  def show
    @reserve = Reserve.find(params[:id])
  end
  
  private

  def reserve_params
    params.require(:reserve).permit(:start, :end, :price, :people)
  end
end


