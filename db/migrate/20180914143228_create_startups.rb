class CreateStartups < ActiveRecord::Migration[5.2]
  def change
    create_table :startups do |t|
      t.string :name
      t.string :rcs
      t.string :creation
      t.string :address
      t.string :people
      t.string :funds
      t.string :activity
      t.string :founders
      t.string :contact
      t.string :seen
      t.string :teammember

      t.timestamps
    end
  end
end
