class CreateNeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :needs do |t|
      t.string :necessidade

      t.timestamps
    end
  end
end
