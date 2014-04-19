class MoveAssignmentRoleToDeveloperFlag < ActiveRecord::Migration
  def up
    add_column :assignments, :developer, :boolean, default: false
    Assignment.where(role: 'developer').update_all(developer: true)
    remove_column :assignments, :role
    change_column :assignments, :developer, :boolean, null: false
  end

  def down
    add_column :assignments, :role, :string, default: 'tester'
    Assignment.where(developer: true).update_all(role: 'developer')
    remove_column :assignments, :developer
    change_column :assignments, :role, :string, null: false
  end
end
