class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :app, index: true
      t.belongs_to :user, index: true
      t.string :role, null: false, default: Assignment.default_role

      t.timestamps
    end

    add_index :assignments, [:app_id, :user_id], unique: true
  end
end
