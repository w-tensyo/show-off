class Gear < ApplicationRecord
  belongs_to :post, optional: true
end
