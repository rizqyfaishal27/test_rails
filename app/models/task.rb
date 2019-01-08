class Task < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates :description, presence: true, length: { minimum: 5 }
    has_many :change_set, class_name: "Change", dependent: :destroy
end
