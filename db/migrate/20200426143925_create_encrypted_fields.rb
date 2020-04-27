class CreateEncryptedFields < ActiveRecord::Migration[6.0]
  def change
    create_table :encrypted_fields do |t|
      t.integer :field_group_id
      t.string :as
      t.string :label
      t.string :encrypted_value
      t.string :salt
      t.string :mask
      t.boolean :required
      t.boolean :disabled

      t.timestamps
    end
  end
end
