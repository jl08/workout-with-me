require "rails_helper"

describe SessionsController do
	describe "POST #create" do
		describe "When successful" do
			before(:each){
				@user = create(:user)
				
			}
			let(:user) {attributes_for(:user)}

			it "redirects to the activities page" do
				post :create, session: { email: user[:email], password: user[:password] }
				expect(response).to redirect_to(activities_path)
			end

			it "sets a sessoin" do 
				post :create, session: { email: user[:email], password: user[:password] }
				expect(session).to have_key(:user_id)
			end

			it "sets session to the user_id" do 
				post :create, session: { email: user[:email], password: user[:password] }
				expect(session[:user_id]).to eq(@user.id)
			end
		end
	end


end