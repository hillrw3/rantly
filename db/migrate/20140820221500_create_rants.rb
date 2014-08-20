class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :subject
      t.string :rant
    end
  end
end
