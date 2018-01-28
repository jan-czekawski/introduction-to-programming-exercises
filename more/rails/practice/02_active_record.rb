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
rails g migration AddUserTable
