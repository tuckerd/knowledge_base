class CreateQuestionsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :questions_users, :id => false do |t|
        t.references :question
        t.references :user
    end
  end

  def self.down
    drop_table :questions_users
  end
end
