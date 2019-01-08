class Task < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    has_many :change_set, class_name: "Change"
end
