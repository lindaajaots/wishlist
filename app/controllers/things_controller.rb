class ThingsController < ApplicationController

def index
  params.require(:thing).permit(:name, :id, :wishlist_id)
end

def new
  @thing = Thing.new(wishlist_id:params[:wishlist_id])
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
end

def show
  @thing = Thing.find_by(id: params[:id])
end

def edit
  @thing = Thing.find(params[:id])
end

def update
  @thing = Thing.find_by(id: params[:id])
  if @thing.update(thing_params)
    redirect_to wishlists_path(params[:wishlist_id])
  else
    render 'edit'
  end
end

def destroy
  Thing.find(params[:id]).destroy
  flash[:success] = "Thing was successfully deleted."
    redirect_to wishlists_path(:wishlist_id)
end

private

def thing_params
  params.require(:thing).permit(:name, :id, :wishlist_id)
end
end
