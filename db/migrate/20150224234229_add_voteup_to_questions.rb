class AddVoteupToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :voteup, :integer
    add_column :questions, :votedown, :integer
  end
end
