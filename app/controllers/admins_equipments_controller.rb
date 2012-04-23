class AdminsEquipmentsController < ApplicationController
  layout 'admin'

  def index
    @equipment = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(params[:equipment])

    if (@equipment.save)
      redirect_to admin_equipments_path
    else
      render :new
    end
  end
end
