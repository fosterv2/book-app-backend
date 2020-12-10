class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_name
      t.string :img_url
      t.text :blurb

      t.timestamps
    end
  end
end
