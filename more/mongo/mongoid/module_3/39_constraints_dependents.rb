# FIELD VALIDATION
# Active Model validations can be added to Mongoid model classes

class Director
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  # (...)
  validates_presence_of :name # name is mandatory
end

# test validation => director with no name
director = Director.create(_id: "12345")
# no of errors
director.errors.count
# all info about errors
director.errors

# use #create! to throw exception right away
director2 = Director.create!(_id: "22332") # exception raised

# DEPENDENT BEHAVIOR
# Mongoid supports dependent options to manage referenced associations
# will instruct Mongoid to handle delete situations

# :delete, :destroy, :nullify, :restrict

# (default) behavior => to orphan the child doc => 1:1 and 1:M leaves child with
# stale reference to removed parent; M:M clears the child of the parent reference (like :nullify)

# :nullify => orphans the child doc after setting the child FK to nil

# :destroy => remove child doc after running model callbacks on the child

# :delete => remvoe child doc without running model callbacks (M:M doesn't remove child doc
# from the db => acts like :nullify)

# :restrict => raise error if child references the parent being removed

# CALLBACKS => Movie Model
before_destroy do |doc|
  puts "before_destroy Movie callback for #{doc.id}, "\
       "sequel_to=#{doc.sequel_to}, writers=#{doc.writer_ids}"
end

after_destroy do |doc|
  puts "after_destroy Movie callback for #{doc.id}, "\
       "sequel_to=#{doc.sequel_to}, writers=#{doc.writer_ids}"
end


# DEMO
# script to all different scenarios
reload!
rocky30 = Movie.create(title: "Rocky 30")
rocky31 = Movie.create(title: "Rocky 31", sequel_to: rocky30)
writer = rocky30.writers.create(name: "A Writer")

# script - data cleanup
p Movie.where(title: { :$regex => "Rocky 3[0-1]"}).delete_all; \
Writer.where(name: { :$regex => "Writer" }).delete_all

# there are callbacks
Movie.new.destroy
Writer.new.destroy

# no callbacks
Movie.new.delete


# DEMO in movie.rb

has_and_belongs_to_many :writers, dependent: :destroy
has_one :sequel, foreign_key: :sequel_of, class_name:"Movie", dependent: :destroy
# script code
rocky30.id
rocky31.id
Movie.where(id: rocky30.id).first.writer_ids
Movie.where(id: rocky31.id).first.sequel_of
Writer.where(id: writer.id).first.movie_ids
rocky30.destroy

# after destroying check if exists
Movie.where(id: rocky30.id).exists?
Movie.where(id: rocky30.id).first.writer_ids if Movie.where(id: rocky30.id).exists?
Movie.where(id: rocky31.id).exists?
Movie.where(id: rocky31.id).first.sequel_of if Movie.where(id: rocky31.id).exists?
Writer.where(id: writer.id).exists?
Writer.where(id: writer.id).first.movie_ids if Writer.where(id: writer.id).exists?
