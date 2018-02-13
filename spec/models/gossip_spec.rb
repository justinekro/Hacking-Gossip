require 'rails_helper'

RSpec.describe Gossip, type: :model do
  it "validates content presence" do
  	user = User.create!(username: "marc", email:"marc@gmail.com", password:"coucou", id:"1", sign_up_code:"GOSSIP2018")
  	gossip = Gossip.new(content:"", user_id: '1').save
  	expect(gossip).to eq(false)
 		end

 	it "validates association to user" do
  	user = User.create!(username: "marc", email:"marc@gmail.com", password:"coucou", id:"1", sign_up_code:"GOSSIP2018")
  	gossip = Gossip.new(content:"Coucou", user_id: '').save
  	expect(gossip).to eq(false)
 	end

end
