class CreateApiTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :api_tokens do |t|
      t.string :name
      t.string :token
      t.boolean :is_active, default: true
      t.datetime :last_accessed_at
      t.text :accessed_by_ips

      t.timestamps
    end
  end
end
