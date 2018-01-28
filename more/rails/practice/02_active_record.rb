# rails g model user
# rails g model user email:string sign_in_count:integer birthday:date

# callback => method that gets called at specific moments of object's lifecycle
# (right before or after creation, deletion, update, validation, saving or loading from the db)

# eg have listing that expires within 30 days of creation
class Listing < ApplicationRecord
  after_create :set_expiry_date
  
  private
  
  def set_expiry_date
    expiry_date = Date.today + 30.days
    self.update_column(:expires_on, expiry_date)
  end
end

# before/after_validation, bef/af_save, around_save, bef/ar/af_create,
# after_commit/rollback, af/ar/bef_update/destroy


# can create model manually (to avoid deleting unnecessary files)
# just create user.rb in app/models/
class User < ActiveRecord::Base # class will inherit all AR features: query methods, validation, callbacks etc.
end

# but also have to make sure that table for corresponding model exists (can generate migration for that)
# rails g migration CreateUser name bio

# rails g migration AddTitleToCategories title:string
# it would create migration that adds a title column to categories table

# rails g migration RemoveTitleFromCategories title:string
# would create migration that removes a title column from the categories table

# rails db:migrate => to run migration

# PROVIDING TYPE for migration of removing column is NOT NECESSARY but HELPFUL

# to create join table (named participations) (of 2 tables => users and groups):
# rails g CreateJoinTableParticipation user:reference group:reference

# using model to update the row in the table
class User < ActiveRecord::Base
end

# first user has to be created
user = User.create(first_name: "Boss", last_name: "Nass")

# then you can find him and update him
user = User.find(1)
user.update(first_name: "Make", last_name: "Peace") # => would return true or false

