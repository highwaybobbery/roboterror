class AdminsEquipmentsController < ApplicationController
  def index
    @equipment = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(params[:equipment])

    if (@equipment.save)
      redirect_to new_admin_equipment_stat_path(@equipment)
    else
      render :new
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @stats = Stat.all
    @equipment_stat = EquipmentStat.all
  end
end
