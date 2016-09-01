class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :product, index: true, foreign_key: true
      t.attachment :file
      t.timestamps null: false
    end
  end
end
