class CreateMiniblogs < ActiveRecord::Migration[6.0]
  def change
    create_table :miniblogs do |t|

      t.string :title, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
