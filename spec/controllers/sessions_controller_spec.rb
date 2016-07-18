require 'rails_helper'

describe SessionsController, :type => :controller do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]
  end

  describe "POST #create" do
    context "with valid log in credentials" do
      pending
      it "saves user information as user" do
        post :create, provider: :spotify

        expect(assigns(:user)).to be_persisted
      end

      it "redirects to playlists page" do
        post :create, provider: :spotify

        expect(response).to redirect_to(playlists_path)
      end
    end
  end
end
