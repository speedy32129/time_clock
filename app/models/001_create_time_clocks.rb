class CreateTimeClocks < ActiveRecord::MigrationTest
  def self.up
    create_table :time_clocks_status do |t|
      t.integer :user_id, :null => false
    end
  end
end