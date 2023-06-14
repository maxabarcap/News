class Publication < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :comments, dependent: :destroy
end
