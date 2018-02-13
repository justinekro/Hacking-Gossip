require 'rails_helper'

RSpec.describe User, type: :model do
  it "validates username presence" do
  	user = User.new(username: "", email:"marc@gmail.com", password:"coucou", sign_up_code:"GOSSIP2018").save
  	expect(user).to eq(false)
 		end

 	it "validates email presence" do
  	user = User.new(username: "marc", email:"", password:"coucou", sign_up_code:"GOSSIP2018").save
  	expect(user).to eq(false)
 	end	

 	it "validates email uniqueness" do
  	user = User.create!(username: "marc", email:"marc@gmail.com", password:"coucou", sign_up_code:"GOSSIP2018")
  	user1 = User.new(username: "marc", email:"", password:"coucou", sign_up_code:"GOSSIP2018").save
  	expect(user1).to eq(false)
 	end	

 	it "validates password presence" do
  	user = User.new(username: "marc", email:"marc@gmail.com", password:"", sign_up_code:"GOSSIP2018").save
  	expect(user).to eq(false)
 	end	
end
