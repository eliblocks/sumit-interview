class Entity < ApplicationRecord
  # An "Entity" represents a legal entity such as a Trust, an LLC, etc.
  validates :name, presence: true
end
