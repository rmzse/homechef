class CheckoutController < ApplicationController
  def index
    if Order.last == nil
      redirect_to root_path
      flash[:notice] = "You have no items in your order"
    else
      @dishes = Order.last.shopping_cart_items.all
      @total_amount = Order.last.total
    end
  end

  def delete
    order = Order.last
    dish = Dish.find_by(id: params[:dish_id])
    order.remove(dish)
    flash[:notice] = "Removed dish from order"
    redirect_back(fallback_location: checkout_index_path)
  end
end
