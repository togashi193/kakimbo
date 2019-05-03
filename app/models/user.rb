class User < ApplicationRecord
  has_many :billings, dependent: :destroy
end
