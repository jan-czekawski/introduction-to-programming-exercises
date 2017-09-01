class Micropost < ApplicationRecord
  belongs_to :user
  # validates :content, "length".intern => { "maximum".to_sym => 140 }
  validates :content, length: { maximum: 140 },
                      presence: true
end
