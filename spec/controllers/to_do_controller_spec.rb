require 'spec_helper'

describe ToDoController do
  context "POST to create" do
    before do
      @valid_params = { :to_do => {
        :name => 'a test todo',
        :image_url => 'image.jpg',
        :priority => rand(99),
        :where => 'a test location',
        :latitude => Faker::Address.latitude,
        :longitude => Faker::Address.longitude,
        :destination_id => Destination.make!.id
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
        expect(response).to redirect_to(to_do_path(assigns(:to_do)))
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
  end
end
