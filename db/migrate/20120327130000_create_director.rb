class CreateDirector < ActiveRecord::Migration
  def up
    add_column :movies, :director, :string, :default => ""
  end

  def down
    remove_column :director
  end
end
