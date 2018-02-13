class RemoveAnonymousAuthorFromGossips < ActiveRecord::Migration[5.1]
  def change
    remove_column :gossips, :anonymous_author, :string
  end
end
