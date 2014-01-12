class DropPosts < ActiveRecord::Migration
  def change
    drop_table :posts

    AuditRails::Audit.where(controller: 'posts').delete_all
  end
end
