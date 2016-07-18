class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
