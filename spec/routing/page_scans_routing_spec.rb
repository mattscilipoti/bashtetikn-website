require "rails_helper"

RSpec.describe PageScansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/page_scans").to route_to("page_scans#index")
    end

    # it "routes to #new" do
    #   expect(get: "/page_scans/new").to route_to("page_scans#new")
    # end

    it "routes to #show" do
      expect(get: "/page_scans/1").to route_to("page_scans#show", id: "1")
    end

    # it "routes to #edit" do
    #   expect(get: "/page_scans/1/edit").to route_to("page_scans#edit", id: "1")
    # end


    # it "routes to #create" do
    #   expect(post: "/page_scans").to route_to("page_scans#create")
    # end

    # it "routes to #update via PUT" do
    #   expect(put: "/page_scans/1").to route_to("page_scans#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(patch: "/page_scans/1").to route_to("page_scans#update", id: "1")
    # end

    it "routes to #destroy" do
      expect(delete: "/page_scans/1").to route_to("page_scans#destroy", id: "1")
    end
  end
end
