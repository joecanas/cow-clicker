class Cow < ApplicationRecord
    validates :url, presence: true, uniqueness: true
end
