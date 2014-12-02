class RenameColumnReply < ActiveRecord::Migration
  def change
  	rename_column("tweets", "reply", "parent_id")
  end
end
