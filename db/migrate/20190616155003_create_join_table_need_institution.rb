class CreateJoinTableNeedInstitution < ActiveRecord::Migration[5.2]
  def change
    create_join_table :needs, :institutions do |t|
      # t.index [:need_id, :institution_id]
      # t.index [:institution_id, :need_id]
    end
  end
end
