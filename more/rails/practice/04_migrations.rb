# rails db:migrate:redo => rollback and migrate
# rails db:migrate:redo STEP=3 => more than 1 migration

# generating migration with adding column of default value might be inefficient
# (cause new column with the default value would have to be added to each row of the table)
# instead:
# 1: generate add_column migration but without default
# 2: migrate, and update column in rake task or rails console while app is running
# make sure app writes data to that new column for new/updated rows
# 3: add another change_column migration, which changes the default of that column to the desired value

# in test env
# rails db:migrate RAILS_ENV=test

# rails db:migrate VERSION=20180129120000 => will run required migrations (up, down, change)
# until it has reached specified version

# rails g migration change_column_in_table
# it would generate
def change
  change_column(:table_name, :column_name, :new_type)
end

# but using up/down would be safer => allows rolling back migration
def up
  change_column(:my_table, :my_columnn, :new_type)
end

def down
  change_column(:my_table, :my_columnn, :old_type)
end

# create hstore column => can be used to store settings (available in postgres
# after you enable the extension)
def change
  create_table :pages do |t|
    enable_extension "hstore" unless extension_enabled?("hstore")
    t.hstore :settings
    t.timestamps
  end
end

# create join table
# rails g migration CreateJoinTableStudentCourse student course

# adding self reference
# can be useful to build a hierarchical tree => use add_reference in migration
def change
  add_reference :pages, :pages
end
# foreign key column will be named "pages_id" but if you want to pick your own
# have to create the column first and then add the reference
def change
  add_column :pages, :parent_id, :integer, null: true, index: true
  add_foreign_key :pages, :pages, column: :parent_id
end

# array column is supported in postgres => rails will automatically convert ruby 
# to postgres and back => array: true in migration

# rails g migration AddEmailToUsers email:string:uniq
# will also add index on email column and set unique: true

# to check migration status
# rails db:migrate:status

# can change existing table
change_table :orders do |t|
  t.remove :ordered_at #removes column ordered at
  t.string :skew_number #add new column
  t.index :skew_number #create index
  t.rename :location, :state #renames location column to state
end

# adding NOT NULL constraint to existing tables
# want to add foreign key company_id to the users table with NOT NULL constraint
# if you have data in table will have to use multiple steps
class AddCompanyIdToUsers
  def up
    # add the column with NULL allowed
    add_column :users, :company_id, :integer
    
    # make sure every row has a value
    User.find_each do |user|
      # find the appropriate company record for the user
      # according to your business logic
      company = Company.first
      user.update!(company_id: company.id)
    end
    
    # and NOT NULL constraint
    change_column_null :users, :company_id, false
  end
  
  # migrations that manipulate data must have up/down method instead of #change
  def down
    remove_column :users, :company_id
  end
end

# can forbid NULL values
def change
  add_column :products, :float, null: false
end

# page 54