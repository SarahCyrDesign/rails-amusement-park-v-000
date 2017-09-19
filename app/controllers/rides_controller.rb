class RidesController < ApplicationController

#get 'rides/new' to: 'rides#new'
  def new
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    if @ride.take_ride == true
      flash[:notice] = "Thank you for riding the #{@ride.attraction.name}"
      redirect_to user_path(@ride.user)
    else
      flash[:notice] = @ride.take_ride
      redirect_to user_path(@ride.user)
    end
  end

end
