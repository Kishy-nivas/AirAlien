class RoomsController < ApplicationController
  before_action :set_room, only: [:show,:edit,:update]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @rooms = current_user.rooms

  end

  def show
    @photos = @room.photos 

  end

  def new
    @room = current_user.rooms.build 

  end

  def create
    @room = current_user.rooms.build(room_params)
    
    if @room.save
      if params[:room][:image]
        params[:room][:image].each do |image| 
         @room.photos.create(image: image )
        end 
      end 
      redirect_to @room ,notice: "saved"
    else 
      render :new 
    end 
  end

  def edit
    if current_user.id == @room.user.id 
      @photos = @room.photos 
    else
      redirect_to root_path , notice: "You don't have permission"
    end 
  end

  def update
    if @room.update(room_params)
      if params[:room][:image]
        params[:room][:image].each do |image|
          @room.photos.create(image: image) 
        end 
      end  

      redirect_to @room, notice: "Updated..."
    else 
      render :edit 
    end 

  end


  private
  def set_room
    @room = Room.find(params[:id])
    
  end

  def room_params
    params.require(:room).permit(:home_type,:room_type,:accommodate,:bed_room,:bath_room,:listing_name,:summary,
      :address,:is_tv,:is_internet, :is_kitchen,:is_air,:is_heating, :price,:active)
  end
  

end
