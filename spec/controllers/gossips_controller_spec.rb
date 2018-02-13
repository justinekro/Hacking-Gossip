require 'rails_helper'

RSpec.describe "gossips/index.html.erb", type: :request do
	before do

		@user1 = User.create!(username: "marc", email:"marc@gmail.com", password:"coucou", id:"1", sign_up_code:"GOSSIP2018")
		@user2 = User.create!(username: "paul", email:"paul@gmail.fr", password:"coucou", id:"2", sign_up_code:"GOSSIP2018")
		@gossip1 = Gossip.create!(content: "coucou", user_id: "1", id:"1")
		@gossip2 = Gossip.create!(content: "salut", user_id: "2", id:"2")


		controller.singleton_class.class_eval do
		  def user_signed_in?
		    true
		  end
		end
  current_user = @user1
  end

	it 'provides from deleting gossips when not logged in' do
	#	expect(delete '/gossips/1').to redirect_to gossips_path
	delete '/gossips/1'
	expect(flash[:error]).to match(/Vous ne pouvez pas supprimer ce gossip */)
	end
end
