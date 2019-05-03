class Game < ApplicationRecord
  has_many :billings, dependent: :destroy
end
