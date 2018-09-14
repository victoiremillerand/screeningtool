class Startup < ApplicationRecord
  validates :name, uniqueness: true
end
