class Institution < ApplicationRecord
  has_and_belongs_to_many :needs
end
