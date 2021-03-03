class ThingsController < ApplicationController

def index
  @wishlist = Wishlist.find_by_id(params[:wishlist_id])
  @things = @wishlist.things
end

def new
  @thing = Thing.new(wishlist_id:params[:wishlist_id])
  puts @thing
end

def create
  puts thing_params
  puts "leibjasai"
  @thing = Thing.create(thing_params)
  if @thing.save
    redirect_to wishlist_path(params[:wishlist_id])
  else
    render 'new'
  end
end

def show
  @thing = Thing.find_by(id: params[:id])
end

def edit
  @thing = Thing.find_by(id: params[:id])
end

def update
  @thing = Thing.find_by(id: params[:id])
  if @thing.update(thing_params)
    redirect_to things_path
  else
    render 'edit'
  end
end

def destroy
  Thing.find(params[:id]).destroy
  flash[:success] = "This thing is deleted"
  redirect_to things_path
end

private

def thing_params
  params.require(:thing).permit(:name, :id, :wishlist_id)
end
end
