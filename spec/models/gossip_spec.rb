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

		it "displays index if user is not logged in" do
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


RSpec.describe "gossips/index.html.erb", type: :request do
	before do
		user1 = User.create!(username: "marc", email:"marc@gmail.com", password:"coucou", id:"1", sign_up_code:"GOSSIP2017")
		user2 = User.create!(username: "marc", email:"marc@gmail.fr", password:"coucou", id:"2", sign_up_code:"GOSSIP2017")
		current_user = user1
		gossip1 = Gossip.create!(content: "coucou", user_id: "1", id:"1")
		gossip2 = Gossip.create!(content: "salut", user_id: "2", id:"2")
    
    controller.singleton_class.class_eval do
      def user_signed_in?
          true
      end
    end
  end

	it 'allows user to delete its own gossips only' do
	#	expect(delete '/gossips/1').to redirect_to gossips_path
	delete '/gossips/2'
	expect(flash[:error]).to match(/Vous ne pouvez pas supprimer ce gossip */)
	end
end
