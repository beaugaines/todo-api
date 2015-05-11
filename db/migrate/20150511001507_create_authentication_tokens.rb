class CreateAuthenticationTokens < ActiveRecord::Migration
  def change
    create_table :authentication_tokens do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :last_used_at
      t.string :ip_address
      t.string :user_agent

      t.timestamps null: false
    end
  end
end
