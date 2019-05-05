# frozen_string_literal: true

# this creates tables needs for time_clock plugin
#     time_clocks
#     time_clocks_history
#     time_clock_status
#     time_clock_personnel
class CreateTimeClocks < ActiveRecord::Migration

  def self.up

    # table for tracking user punches in or out
    create_table :time_clocks do |t|
      t.integer :user_id, null: false
      t.float :hours, null: false, default: 0
      t.integer :status_id, null: false
      t.string :comment, limit: 50
      t.timestamp :start_on
      t.timestamp :end_on
      t.timestamp :create_on, null: false, default: Time.now
      t.integer :create_by, null: false
      t.timestamp :update_on
      t.integer :update_by
      t.integer :tcyear, limit: 3
      t.integer :tcmonth, limit: 3
      t.integer :tcweek, limit: 2
      t.integer :tcday, limit: 1
    end

    add_index :time_clocks, :user_id
    add_index :time_clocks, :tcyear
    add_index :time_clocks, :tcmonth
    add_index :time_clocks, :tcweek
    add_index :time_clocks, :tcday

    add_index :time_clocks, [:user_id], name: :time_clocks_user_id

    #add_index(:time_clocks, [:user_id, :tcyear, :tcmonth, :tcweek, :tcday, :update_on], order: {tcyear: :desc, tcmonth: :desc, tcday: :desc, updated_on: :desc})

    # table for tracking historical changes for users
    create_table :time_clocks_history do |t|
      # the id reference history id
      # the former id from time clocks now becomes time_clocks_id
      t.integer :time_clocks_id, null: false
      t.integer :user_id, null: false
      t.float :hours, null: false, default: 0
      t.integer :status_id, null: false
      t.string :comment, limit: 50
      t.timestamp :start_on
      t.timestamp :end_on
      t.timestamp :create_on, null: false, default: Time.now
      t.integer :create_by, null: false
      t.timestamp :update_on
      t.integer :update_by
      t.integer :tcyear, limit: 3
      t.integer :tcmonth, limit: 3
      t.integer :tcweek, limit: 2
      t.integer :tcday, limit: 1
    end

    #add_index :time_clocks_history, [:user_id, :create_on, :tcyear, :tcmonth, :tcweek, :tcday], order: {}

    create_table :time_clock_status do |t|
      t.string :status_desc, null: false
      t.boolean :is_available, default: false
      t.timestamp :create_on, null: false, default: Time.now
      t.integer :create_by, null: false
      t.timestamp :update_on
      t.integer :update_by
    end

    add_index :time_clock_status, [:id], name: :time_clock_status_id

    #create_table :time_clock_personnel do |t|
    #end

  end

  def self.down

    drop_table(:time_clock_status, if_exists: true)
    drop_table(:time_clocks_history, if_exists: true)
    drop_table(:time_clocks, if_exists: true)
    drop_table(:time_clock_personnel, if_exists: true)

  end

end
