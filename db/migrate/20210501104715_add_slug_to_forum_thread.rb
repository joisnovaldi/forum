class AddSlugToForumThread < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_threads, :slug, :string
  end
end
