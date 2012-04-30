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
      redirect_to edit_admin_equipment_path(@equipment)
    else
      render :new
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @stats = Stat.all
    @equipment_stats = EquipmentStat.find_all_by_equipment_id(params[:id])
  end
end
