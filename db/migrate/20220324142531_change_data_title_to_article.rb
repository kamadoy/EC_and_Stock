class ChangeDataTitleToArticle < ActiveRecord::Migration[6.1]
  def change
    change_column :genres, :name, :string
  end
end
