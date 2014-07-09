class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :header
      t.text :perex
      t.string :url
      t.belongs_to :category
      t.timestamps
    end
  end
end
