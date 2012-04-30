require 'spec_helper'
require 'helpers/helper'

RSpec.configure do |c|
  c.include Helpers
end

describe AdminsEquipmentsStatsController do
  context "JSON" do
    describe "POST new" do
      before do
        @equipment = create :equipment
        @stat = create :stat
      end

      it "creates a new equipment_stat" do
        json = { :format => 'json', :equipment_stat =>
          { :equipment_id => @equipment.id, :stat_id => @stat.id, :modifier => 2 } }

        post :create, json

        json = response_json
        json.should include 'equipment'
        json.should include 'equipment_stat'
        json['equipment_stat'].should include 'stat_name'
        json.should_not include 'error'
      end
    end

    describe "PUT update" do
      before do
        @equipment = create :equipment
        @stat = create :stat
        @equipment_stat = create :equipment_stat, :equipment => @equipment, :stat => @stat
      end

      it "updates an existing equipment_stat" do
        json = { :format => 'json', :equipment_stat_id => @equipment_stat.id, :equipment_stat =>
          { :equipment_id => @equipment.id,
            :stat_id => @stat.id, :modifier => 4 } }

        put :update, json

        json = response_json
        json.should include 'equipment'
        json.should include 'equipment_stat'
        json.should_not include 'error'
        json['equipment_stat']['modifier'].should == 4
      end
    end
  end
end
