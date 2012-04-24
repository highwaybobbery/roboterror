class InventoriesController < ApplicationController
  def new
    @inventory = Inventory.new
    @equipment = Equipment.all
  end

  def create
    @inventory = current_user.inventories.build(params[:inventory])
    @inventory.price = @inventory.equipment.price
    if(current_user.balance >= @inventory.price)
      if(@inventory.save && current_user.spend(@inventory.price))
        redirect_to root_path
      else
        @equipment = Equipment.all
        render :new
      end
    else
      flash.now[:error] = 'You cannot afford this equipment'
      render :new
    end
  end
end
