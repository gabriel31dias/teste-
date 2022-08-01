class CreateParkings < ActiveRecord::Migration[6.1]
    def change
      create_table :parkings do |t|
        t.string :plate
        t.boolean :paid , :default => false, :null => false
        t.boolean :left , :default => false, :null => false
        t.boolean :teste , :default => false, :null => false
        t.timestamps
      end
    end
  end
  