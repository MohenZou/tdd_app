class ShowsController < ApplicationController
  def index
  	@shows = Show.all
  end

  def show
  end

  def new
  	@show = Show.new
  end

  def create
  	show_params = params.require(:show).permit(:name, :place)
  	@show = Show.new(show_params)
  	if @show.save
  		redirect_to '/'
  	else
  		render 'new'
  	end
  end
end
