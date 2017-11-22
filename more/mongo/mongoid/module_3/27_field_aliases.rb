class Actor
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :birthName, as: :birth_name, type: String
  # birthName in document => mapped to birth_name in model 
  # applied rails naming convention
  # good with compression
end

# in console both will work
Actor.find("nm0993498").birthName
Actor.find("nm0993498").birth_name