class User < ApplicationRecord
    has_many :sender_transactions, foreign_key: "sender_id", class_name: "Transaction"
    has_many :receiver_transactions, foreign_key: "receiver_id", class_name: "Transaction"

    validates :username, presence: true, uniqueness: true
    validates :balance, presence: true, numericality: true
end
