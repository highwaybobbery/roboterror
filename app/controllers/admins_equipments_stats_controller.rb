class AdminsEquipmentsStatsController < ApplicationController
  respond_to :json

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @stats = Stat.all
    @equipment_stat = EquipmentStat.all
  end

  def create
    @equipment_stat = EquipmentStat.create(params[:equipment_stat])
    @equipment = @equipment_stat.equipment
    response_hash = { :equipment_stat => @equipment_stat,
      :equipment => @equipment }
    respond_with response_hash, :location => nil
  end

  def update
    @equipment_stat = EquipmentStat.find(params[:equipment_stat][:id])
    @equipment_stat.update_attributes(params[:equipment_stat])
    @equipment = @equipment_stat.equipment
    response_hash = { :equipment_stat => @equipment_stat,
      :equipment => @equipment }
    render json: response_hash
  end
end
