#- spec/controllers/vehicles_controller_spec.rb
require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  # the following line was commented because there are view tests
  #render_views  
  
  before :each do
    vehicles = [{:name => 'Amy'}, 
              {:name => 'Jeff'},
              {:name => 'Sean'},
              {:name => 'Joe'},
     ]
    @vehicles = vehicles.map { |vehicle| Vehicle.create vehicle } 
    #@vehicles_attributes = {:name => 'Amy'} 
    #@vehicles = Vehicle.create!(@vehicles_attributes)        
  	 
    #@vehicles = vehicles.map { |vehicle| Vehicle.create vehicle } 
  end
  
  #describe "GET #show" do
  #  subject { get :show, id: @vehicles[0] }
    
  #  it "assigns the requested vehicles[0] to @vehicle" do 
  #    get :show, id: @vehicles[0]
  #    assigns(:vehicle).should eq @vehicles[0]
  #  end
    
  #  it "renders the show template" do
  #    expect(subject).to render_template :show
  #    expect(subject).to render_template "show" 
  #  end
  #end
  
  
  #describe "GET #new" do
  #  subject { get :new }
    
  #  it "renders the new template" do
  #    expect(subject).to render_template :new
  #    expect(subject).to render_template "new" 
  #  end
  #end
  
  #describe "GET #edit" do
  #  subject { get :edit, id: @vehicles[1] }
  #  
  #  it "assigns the requested vehicles[1] to @vehicle" do 
  #    get :edit, id: @vehicles[1]
  #    assigns(:vehicle).should eq @vehicles[1]
  #  end
  #  
  #  it "renders the show template" do
  #    expect(subject).to render_template :edit
  #    expect(subject).to render_template "edit" 
  #  end
  #end
  describe "GET #index" do
    subject { get :index }
    
    it "renders the index template" do
      expect(subject).to render_template :index
      expect(subject).to render_template "vehicles/index" 
    end

  end

   describe "POST #create" do
    context "with valid attributes" do
      it "creates a new vehicle" do 
        expect{ post :create, params: {id: @vehicles[0]} #id: @vehicles[0]
              }.to change(Vehicle,:count).by(1) 
      end

      it "redirects to /vehicles after created" do
        post :create, name: @vehicles
        response.should redirect_to :vehicles
      end

      it "shows a notification message after created" do
        post :create, name: @vehicles
        flash[:notice].should =~ /#{assigns(:vehicle).name} was successfully created./i
      end
    end
    
=begin
    TODO: there are not validations, skipped this case
    context "with invalid attributes" do
    end
=end
    
  end



  describe "PUT #update" do
    context "valid attributes" do
      it "located the requested @vehicle" do 
        put :update, id: @vehicles[1], vehicle: @vehicles[1].attributes
        assigns(:vehicle).should eq @vehicles[1]
      end 
      
      it "changes @vehicle's attributes" do 
        put :update, id: @vehicles[1], vehicle: @vehicles[1].attributes = { name: 'Amy' }
        @vehicles[1].reload 
        @vehicles[1].name.should eq "Amy"
      end 
      
      it "redirects to the /vehicles after updated" do 
        put :update, id: @vehicles[1], vehicle: @vehicles[1].attributes
          response.should redirect_to vehicle_path 
      end 
      
      it "shows a correct message after updated" do
        put :update, id: @vehicles[1], vehicle: @vehicles[1].attributes
        flash[:notice].should =~ /#{@vehicles[1].name} was successfully updated./i
      end
    end
    
=begin
    TODO: there are not validations, skipped this case
    context "with invalid attributes" do
    end
=end
  end
  
  describe "DELETE #destroy" do
    it "deletes the vehicle" do 
      expect{ 
        delete :destroy, params: {id: @vehicles}
        }.to change(Vehicle,:count).by(-1) 
    end 
    
    it "redirects to vehicles#index" do 
      delete :destroy, id: @vehicles
      response.should redirect_to :vehicles
    end
    
    it "shows a correct message after deleted" do
      delete :destroy, id: @vehicles, vehicle: @vehicles[1].attributes
      flash[:notice].should =~ /Vehicle '#{@vehicles[1].name}' deleted./i
    end
  end

end