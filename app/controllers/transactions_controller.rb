class TransactionsController < ApplicationController

    def index
        @current_user = User.find_by_username(session[:username])

        @approved_transactions = Transaction.all.where(approved: true, sender_id: @current_user.id).or(Transaction.all.where(approved: true, receiver_id: @current_user.id))
        @unapproved_transactions = Transaction.all.where(approved: false, sender_id: @current_user.id)
    end

    def update
        @transaction = Transaction.find(params[:id])
        @transaction.update(approved: true)        
        update_balances(User.find(@transaction.sender_id), User.find(@transaction.receiver_id), @transaction.amount)
        redirect_to root_path
    end

    private

    def update_balances(sender, receiver, amount)
        sender.update(balance: sender.balance - @transaction.amount)
        receiver.update(balance: receiver.balance + @transaction.amount)
    end
end
