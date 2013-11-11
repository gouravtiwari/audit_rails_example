# This migration comes from audit_rails (originally 20121213191242)
class CreateAuditRailsAudits < ActiveRecord::Migration
  def change
    create_table :audit_rails_audits do |t|
      t.string :action
      t.string :controller
      t.string :description
      t.string :user_name
      t.string :ip_address

      t.timestamps
    end
  end
end
