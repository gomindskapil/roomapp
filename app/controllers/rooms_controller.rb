 class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :show]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = current_user.rooms
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @photos = @room.photos
    @reviews = Review.where(room_id: @room.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end

   
  end

  # GET /rooms/new
  def new
    @room = current_user.rooms.build
  end

  # GET /rooms/1/edit
  def edit
    if current_user.id == @room.user.id
    @photos =@room.photos
  else
    redirect_to root_path, notice: "You don't have permission"
    end
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = current_user.rooms.build(room_params)

    respond_to do |format|
      if @room.save

        if params[:images]
          params[:images].each do |image|
           @room.photos.create(image: image)
           end
           end 
           @photos = @room.photos
        format.html { redirect_to edit_room_path(@room), notice: 'Room was successfully created.' }
      
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
         if params[:images]
          params[:images].each do |image|
           @room.photos.create(image: image)
           end
           end 
         


        format.html { redirect_to edit_room_path(@room), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy

    @photo.destroy
    @photos = Photo.where(room_id: room_id)
    @photos =@room.photos
    respond_to :js

    @room.destroy
  
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active, :image)
    end
end
