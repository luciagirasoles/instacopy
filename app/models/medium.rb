class Medium < ApplicationRecord
  belongs_to :post, optional: true
end
