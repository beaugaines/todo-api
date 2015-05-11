class AddBodyToAuthenticationTokens < ActiveRecord::Migration
  def change
    add_column :authentication_tokens, :body, :string
  end
end
