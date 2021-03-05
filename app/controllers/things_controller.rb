class ThingsController < ApplicationController

def index
  params.require(:thing).permit(:name, :id, :wishlist_id)
end

def new
  @thing = Thing.new(wishlist_id:params[:wishlist_id])
  puts @thing
end

def create
  @thing = Thing.create(thing_params)
  respond_to do |format|
  if @thing.save
    format.html { redirect_to wishlists_path(wishlist_id:params[:wishlist_id]), notice: "New thing was successfully created." }
  else
    render 'new'
  end
end

def show
  @thing = Thing.find_by(id: params[:id])
  puts @thing
  puts "reede"
end

def edit
  @thing = Thing.find(params[:id])
  puts @thing
  puts "reede"
end

def update
  @thing = Thing.find_by(id: params[:id])
  if @thing.update(thing_params)
    redirect_to wishlists_path(params[:wishlist_id])
  else
    render 'edit'
  end
end
end

def destroy
  @Thing = Thing.find(params[:id])
  @Thing.destroy

  respond_to do |format|
    format.html { redirect_to wishlists_path(:wishlist_id), notice: "Thing was successfully deleted." }
  end
end

private

def thing_params
  params.require(:thing).permit(:name, :id, :wishlist_id)
end
end
