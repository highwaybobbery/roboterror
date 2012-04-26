class AdminsEquipmentsStatsController < ApplicationController
  def new
    @equipment = Equipment.find(params[:equipment_id])
    @stats = Stat.all
    @equipment_stat = EquipmentStat.all
  end

  def create

  end
end
