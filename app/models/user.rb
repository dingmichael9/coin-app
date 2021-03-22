class User < ApplicationRecord
    has_many :sender_transactions, foreign_key: "sender_id", class_name: "Transaction"
    has_many :receiver_transactions, foreign_key: "receiver_id", class_name: "Transaction"

    validates :username, presence: { message: "You must enter a username" }, uniqueness: { message: "Username is already taken" }
    validates :balance, presence: true, numericality: true
end
