class TransactionsController < ApplicationController

    def index
        @current_user = User.find_by_username(session[:username])
        @approved_transactions = Transaction.all.where(approved: true, sender_id: @current_user.id).or(Transaction.all.where(approved: true, receiver_id: @current_user.id))
        @unapproved_transactions = Transaction.all.where(approved: false, sender_id: @current_user.id).or(Transaction.all.where(approved: false, receiver_id: @current_user.id))
    end

    def new
        @transaction = Transaction.new
    end

    def create 
        @transaction = Transaction.new

        if params[:transaction][:target_username] == session[:username]
            flash.now[:error] = "You can't transfer money to yourself"
            render :new
            return
        elsif params[:transaction][:target_username] == ""
            flash.now[:error] = "You must enter a recepient"
            render :new
            return
        elsif params[:commit] == "Send"
            @sender = User.find_by_username(session[:username])
            @receiver = User.find_by_username(params[:transaction][:target_username]) if User.find_by_username(params[:transaction][:target_username])
            @approved = true
        elsif params[:commit] == "Request"
            @sender = User.find_by_username(params[:transaction][:target_username]) if User.find_by_username(params[:transaction][:target_username])
            @receiver = User.find_by_username(session[:username])
            @approved = false
        end
        
        @transaction.sender_id = @sender ? @sender.id : -1
        @transaction.receiver_id = @receiver ? @receiver.id : -1
        @transaction.amount = params[:transaction][:amount]
        @transaction.approved = @approved

        puts params[:transaction][:amount]

        if @transaction.save
            if @transaction.approved
                update_balances(@sender, @receiver, @transaction.amount)
                puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
                puts @transaction.amount
            end
            redirect_to root_path
        else
            render :new
        end
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
