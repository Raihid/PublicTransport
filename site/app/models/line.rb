class Line < ApplicationRecord
    has_and_belongs_to_many :stops
end
