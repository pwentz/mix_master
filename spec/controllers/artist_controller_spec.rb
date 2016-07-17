require 'rails_helper'

describe ArtistsController, :type => :controller do
  describe "GET #index" do
    it "assigns all artists as @artists and renders index template" do
      artist = create(:artist)

      get(:index)

      expect(assigns(:artists)).to eq([artist])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns artist parameters to correct @artist and renders show template" do
      artist = create(:artist)

      get(:show, {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new artist as @artist" do
      artist = create(:artist)

      get(:new)

      expect(assigns(:artist)).to be_a_new(Artist)
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "assigns parameters to correct artist and renders edit template" do
      artist = create(:artist)

      get(:edit, {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new artist" do
        expect {
          post :create, {:artist => attributes_for(:artist)}
        }.to change(Artist, :count).by(1)
      end

      it "assigns a newly created artist as @artist" do
        post :create, {:artist => attributes_for("artist")}
        expect(assigns(:artist)).to be_a(Artist)
        expect(assigns(:artist)).to be_persisted
      end

      it "redirects to the created artist" do
        post :create, {:artist => attributes_for("artist")}
        expect(response).to redirect_to(Artist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created variable, but goes unsaved as @artist" do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).not_to be_persisted
      end

      it "does not redirect to artist page, but re-renders the new template" do
        post :create, {:artist => attributes_for(:artist, name: nil)}

        expect(controller).to set_flash.to("Please enter a longer name")
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates attributes on existing artist" do
        artist = create(:artist)

        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "Update name")}
        artist.reload
        expect(artist.name).to eq("Update name")
      end

      it "assigns requested artist as @artist" do
        artist = create(:artist)
        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "Update name")}
        expect(assigns(:artist)).to eq(artist)
      end

      it "redirects to the newly updated artist" do
        artist = create(:artist)

        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "Update name")}
        expect(response).to redirect_to(artist_path artist)
      end
    end

    context "with invalid params" do
      it "assigns requested artist as @artist, but does not save invalid changes" do
        artist = create(:artist)

        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: ("A" * 45))}

        expect(assigns(:artist)).to eq(artist)
        expect{
          artist.reload
        }.to_not change(artist, :name)
      end

      it "re-renders the edit template" do
        artist = create(:artist)

        put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "")}

        expect(controller).to set_flash.to("Please enter a longer name")
        expect(response).to redirect_to(edit_artist_path artist)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes requested artist" do
      artist = create(:artist)
      delete :destroy, {:id => artist.to_param}
      expect { artist.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "redirects to artists' index" do
      artist = create(:artist)
      delete :destroy, {:id => artist.to_param}
      expect(response).to redirect_to(artists_path)
    end
  end
end
