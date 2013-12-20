class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :blurb
      t.integer :goal
      t.integer :pledged
      t.string :state
      t.string :country
      t.string :currency
      t.string :currency_symbol
      t.integer :deadline
      t.integer :created_at
      t.integer :launched_at
      t.integer :backers_count
      t.string :photo
      t.string :creator
      t.string :location
      t.string :category
      t.string :urls
      t.timestamps
    end
  end
end
