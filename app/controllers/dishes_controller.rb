class DishesController < ApplicationController

	def show
    @dish = Dish.find(params[:id])
	end

	def new
		user = current_user
		new_user_dish(user)
	end

end
