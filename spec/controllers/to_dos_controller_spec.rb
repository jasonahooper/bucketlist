require 'spec_helper'

describe ToDosController do
  context "POST to create" do
    before do
      @destination = Destination.make!
      @valid_params = { :destination_id => @destination.id,
        :to_do => {
        :name => 'a test todo',
        :image_url => 'image.jpg',
        :priority => rand(99),
        :where => 'a test location',
        :latitude => Faker::Address.latitude,
        :longitude => Faker::Address.longitude,
        :destination_id => @destination.id
        }
      }
    end

    context "with HTML" do
      before do
        post :create, @valid_params
      end

      it "should save a new ToDo" do
        ToDo.count.should eq(1)
      end

      it "should redirect me to the show page" do
        expect(response).to redirect_to(destination_to_do_path(@destination.id, assigns(:to_do)))
      end
    end

    context "with JS" do
      before do
        xhr :post, :create, @valid_params
      end

      it "should save a new Destination" do
        ToDo.count.should eq(1)
      end

      it "should respond with javascript" do
        response.content_type.should eq('text/javascript')
        expect(response).to be_success
      end
    end
    context "GET to index" do
      context "as HTML" do
        before do
          @low = ToDo.make!(:low, :destination_id => @destination.id)
          @high = ToDo.make!(:high, :destination_id => @destination.id)

          get :index, @valid_params
        end

        it "should find ToDo items in order of priority" do
          expect(assigns(:to_dos).length).to eq(2)
          expect(assigns(:to_dos).first).to eq(@high)
          expect(assigns(:to_dos).second).to eq(@low)
        end
      end

      context "as JSON" do
        before do
          get :index, @valid_params.merge(:format => :json)
        end

        it "should return JSON" do
          response.content_type.should eq('application/json')
          expect(response).to be_success
        end
      end
    end
  end
end
