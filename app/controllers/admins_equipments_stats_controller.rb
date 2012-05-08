class AdminsEquipmentsStatsController < ApplicationController
  respond_to :json

  def create
    equipment_stat = EquipmentStat.create(params[:equipment_stat])
    equipment = equipment_stat.equipment
    response_hash = { :equipment_stat => equipment_stat,
      :equipment => equipment }
    respond_with response_hash, :location => nil
  end

  def update
    equipment_stat = EquipmentStat.find(params[:equipment_stat_id])
    equipment_stat.update_attributes(params[:equipment_stat])
    equipment = equipment_stat.equipment
    response_hash = { :equipment_stat => equipment_stat,
      :equipment => equipment }
    render json: response_hash
  end

  def destroy
    equipment_stat = EquipmentStat.find(params[:id])

    if equipment_stat.destroy
      equipment = equipment_stat.equipment
      render json: { :success => true, :equipment_stat => equipment_stat, :equipment => equipment }
    else
      render json: equipment_stat
    end
  end
end
