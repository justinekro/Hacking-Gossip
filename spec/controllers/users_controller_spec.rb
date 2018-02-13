require 'rails_helper'

RSpec.describe "devise/registrations/new/html.erb", type: :request do
	it 'prevents from subscribing without code' do
  	post '/users', params: {user:{username: "coucou", email: "coucou@gmail.com", password: "coucou", sign_up_code:""}}
		expect(response.body).to include("Sign up code is not included in the list")
  end

  it 'allows to subscribe with the right code' do
  	post '/users', params: {user: {username: "coucou", email: "coucou@gmail.com", password: "coucou",password_confirmation: "coucou", sign_up_code:"GOSSIP2018"}}
  	assert_redirected_to root_path
  end

  it 'redirects to index page after log in' do
  	user = User.create!(username:"salut", email: "coucou@gmail.com", password: "coucou", sign_up_code:"GOSSIP2018")
  	post '/users/sign_in', params: {user: {email: "coucou@gmail.com", password: "coucou", remember_me: "0"}}
    assert_redirected_to root_path
  end
end
