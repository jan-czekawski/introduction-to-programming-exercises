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