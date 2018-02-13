require 'rails_helper'

RSpec.describe "gossips/index.html.erb", type: :view do
	describe 'case one : logged in' do
		before do
		    controller.singleton_class.class_eval do
		      def user_signed_in?
		          true
		      end
		    end
		    @gossips = Gossip.all
		end

		it "displays index if user is logged in" do
		  render
		  expect(rendered).to include("Retrouvez l'ensemble des Gossips")
		end
	end

	describe 'case two : not logged in' do
		before do
		    controller.singleton_class.class_eval do
		      def user_signed_in?
		          false
		      end
		    end
		end

		it "displays login button if user is not logged in" do
		  render
		  expect(rendered).to include("Vous souhaitez découvrir nos gossips ?")
		end
	end
end
