class Transaction < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"
    
    validates :amount, numericality: true
    validates :sender_id, presence: true
    validates :receiver_id, presence: true
    validates :approved, presence: true
end
