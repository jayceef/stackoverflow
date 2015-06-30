class AddVoteupToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :voteup, :integer
    add_column :answers, :votedown, :integer
  end
end
