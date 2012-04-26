describe AdminsEquipmentsStatsController do
  context "JSON" do
    describe "POST new" do
      before do
        @equipment = create :equipment
        @stat = create :stat
      end

      it "creates a new equipment_stat" do
        json = { :format => 'json', :application => { :stat => @stat.id, :modifier => 2 } }
        post :create, json
      end
    end

    describe "PUT update" do

    end
  end
end
        json = response_json
        assert json['error'].present?

    module Helpers
      def response_json
        ActiveSupport::JSON.decode @response.body
      end
    end
