require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before(:all) do
        @deiver_1 = User.create(name: "Yimin")
        @deiver_2 = User.create(name: "Chou")
    end

    it "#index" do
        login_with ( :user )
        get :index
        expect(response).to render_template(:index)
    end


end