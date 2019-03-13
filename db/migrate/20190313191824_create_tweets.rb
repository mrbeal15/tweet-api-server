class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :topic
      t.string :author
      t.string :content, null: false, index: { unique: true }
      t.datetime :published_date

      t.timestamps
    end
  end
end
