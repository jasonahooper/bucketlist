require 'spec_helper'

describe DestinationsController do
  context "POST to create" do
    before do
      @valid_params = { :destination => {
        :name => Faker::Address.country,
        :image_url => 'image.jpg',
        :traveller_id => Traveller.make!.id
        }
      }
    end

    context "with HTML" do
      before do
        post :create, @valid_params
      end

      it "should save a new Destination" do
        Destination.count.should eq(1)
      end

      it "should redirect me to the show page" do
        expect(response).to redirect_to(destination_path(assigns(:destination)))
      end
    end

    context "with JS" do
      before do
        xhr :post, :create, @valid_params
      end

      it "should save a new Destination" do
        Destination.count.should eq(1)
      end

      it "should respond with javascript" do
        response.content_type.should eq('text/javascript')
        expect(response).to be_success
      end
    end
  end
end
