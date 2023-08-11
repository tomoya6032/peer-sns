class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :name
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
