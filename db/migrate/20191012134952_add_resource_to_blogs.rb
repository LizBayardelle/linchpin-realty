class AddResourceToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :resource, foreign_key: true
  end
end
