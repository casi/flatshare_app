class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false

    # default (technical) user
    User.create!(id:                    0,
                 name:                  "Deleted User",
                 email:                 "default@example.org",
                 password:              "password",
                 password_confirmation: "password",
                 admin:                 false)

    # initial admin user
    User.create!(name:                  "Example User (=Admin user)",
                 email:                 "admin@example.org",
                 phone:                 "1234567890",
                 birthday:              "2000-01-01",
                 description:           "write something interesting about you ;)",
                 password:              "password",
                 password_confirmation: "password",
                 admin:                 true)
  end
end
