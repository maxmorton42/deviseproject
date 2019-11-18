class RestaurantsController < ApplicationController
 
    before_action :set_restaurant, only: [:show, :edit, :update]
  
    def index
      @restaurants = current_user.restaurants
    end
  
    def show
    end
  
    def new
      @restaurant = Restaurant.new
    end
  
    def create
      @restaurant = current_user.restaurants.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurants_path
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @restaurant.update(restaurant_params)
        redirect_to restaurants_path
      else
        render :edit
      end
    end
  
    def destroy
      @restaurant.destroy
      redirect_to restaurants_path
    end
  
    private
      def restaurant_params
        params.require(:restaurant).permit(:name, :specials)
      end

      def set_account
        @restaurant = current_user.restaurants.find(params[:id])
      end
  
end