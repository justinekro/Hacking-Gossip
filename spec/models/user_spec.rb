require 'rails_helper'

RSpec.describe "devise/registrations/new/html.erb", type: :request do
	it 'prevents from subscribing without code' do
  	post '/users', params: {username: "coucou", email: "coucou@gmail.com", password: "coucou", sign_up_code:""}
		expect(response.body).to include("Sign up code is not included in the list")
  end

  it 'allows to subscribe with the right code' do
  	post '/users', params: {username: "coucou", email: "coucou@gmail.com", password: "coucou", sign_up_code:"GOSSIP2017"}
  	expect(response).to have_http_status(200)
  end

#  it 'redirects subscribed member to index' do
#  	post '/users', params: {username: "coucou", email: "coucou@gmail.com", password: "coucou", sign_up_code:"GOSSIP2017"}
# 		expect(response.location).to eq(root_path)

#		expect(response).to redirect_to root_path
#  end
end

