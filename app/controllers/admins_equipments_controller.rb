class AdminsEquipmentsController < ApplicationController
  def index
    @equipment = Equipment.all
  end

  def new
    @chasses = Chassis.all
    @equipment_types = EquipmentType.all
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
    @equipment_stats = @equipment.equipment_stats
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.delete
    redirect_to admin_equipments_path
  end
end
