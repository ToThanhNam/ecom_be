# frozen_string_literal: true

class AddDeviseToAdmins < ActiveRecord::Migration[6.1]  # Use your actual Rails version
  def change
    change_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "" unless column_exists?(:admins, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:admins, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:admins, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:admins, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:admins, :remember_created_at)

      # Add any other Devise columns you need, following the same pattern
    end

    add_index :admins, :email,                unique: true unless index_exists?(:admins, :email)
    add_index :admins, :reset_password_token, unique: true unless index_exists?(:admins, :reset_password_token)
  end
end
