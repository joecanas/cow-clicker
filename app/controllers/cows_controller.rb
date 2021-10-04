class CowsController < ApplicationController
  before_action :set_cow, only: [:show, :edit, :update, :destroy]

  def index
    @cows = Cow.all
  end

  def new
    @cow = Cow.new
  end

  def show
    render :show
  end

  def create
    @cow = Cow.new(cow_params)

    if @cow.save
      redirect_to @cow, alert: "Cow created"
    else
      # Preserve validation error message array before render
      flash[:message] = @cow.errors.full_messages
      render new_cow_path, alert: "Error: Your cow could not be created"
    end
  end

  def edit
  end

  def update
    @cow.update(cow_params)
    redirect_to @cow, alert: "Cow updated"
  end

  def set_cow
    @cow = Cow.find(params[:id])
  end

  def upvote
    Cow.increment_counter(:clicks, params[:id])
    redirect_to cow_path, alert: "Cow click recorded"
  end

  def destroy
    @cow.destroy
    redirect_to root_path, alert: "Cow record deleted"
  end

  private

  def cow_params
    params.require(:cow).permit(:url)
  end
end
