class Stop < ApplicationRecord
    has_and_belongs_to_many :lines
end
