class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :street,     default: ''
      t.string :city,       default: ''
      t.string :state,      default: ''
      t.string :country,    default: ''
      t.string :zip,        default: ''
      t.string :lookup,     default: ''
      t.boolean :processed, default: false
      t.float  :latitude
      t.float  :longitude

      t.timestamps
    end

    add_index :locations, [:latitude, :longitude]
  end
end
