require 'rails_helper'

describe PlaylistsController, :type => :controller do
  describe "POST #create" do
    context "with valid params" do
      it "assigns requested playlist to @playlist" do
        post :create, :playlist => attributes_for(:playlist)

        expect(assigns(:playlist)).to be_an(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to playlist's index page" do
        post :create, :playlist => attributes_for(:playlist)

        expect(response).to redirect_to(playlists_path)
      end
    end

    context "with invalid params" do
      it "saves into new record, but does not save into database" do
        post :create, :playlist => attributes_for(:playlist, name: "")

        expect(assigns(:playlist)).to be_a_new(Playlist)
        expect(assigns(:playlist)).not_to be_persisted
      end

      it "re-renders the new template" do
        post :create, :playlist => attributes_for(:playlist, name: "")

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "assigns updated attributes to requested playlist" do
        playlist = create(:playlist)
        former_playlist_name = playlist.name
        updated_name = "My new jams"

        expect{
          put :update, :id => playlist.to_param, :playlist => attributes_for(:playlist, name: updated_name)
          playlist.reload 
        }.to change(playlist, :name).from(former_playlist_name).to(updated_name)
      end

      it "redirects to the requested playlist's page" do
        playlist = create(:playlist)
        put :update, :id => playlist.to_param, :playlist => attributes_for(:playlist)

        expect(response).to redirect_to(playlist_path playlist)
      end
    end

    context "with invalid params" do
      it "assigns requested playlist to @playlist, but attributes are not saved" do
        playlist = create(:playlist)
        put :update, :id => playlist.to_param, :playlist => attributes_for(:playlist, name: "")

        expect(assigns(:playlist)).to eq(playlist)
        expect{ 
          playlist.reload
        }.not_to change(playlist, :name)
      end

      it "re-renders the 'edit' template" do
        playlist = create(:playlist)
        put :update, :id => playlist.to_param, :playlist => attributes_for(:playlist, name: "")

        expect(response).to render_template("edit")
      end
    end
  end
end
