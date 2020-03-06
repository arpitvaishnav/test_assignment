class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.bigint :follower_id
      t.bigint :followed_id
      t.references :followable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
