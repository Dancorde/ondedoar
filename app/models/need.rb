class Need < ApplicationRecord
  has_and_belongs_to_many :institutions, dependent: :destroy
end
