class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
    def withdrawal(amount)
     self.balance -= amount
   end

  def valid?
   @sender.valid? && @receiver.valid? ? true : false
  end

  # can execute a successful transaction between two accounts
  #       each transfer can only happen once
  #       rejects a transfer if the sender doesn't have a valid account (FAILED - 3)

  def execute_transaction
     if self.valid? && self.status == "pending" && @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
     else
       self.reject_transfer
     end
   end

      def reverse_transfer
      if self.valid? && self.status == "complete" && @sender.balance > @amount
         @sender.balance += @amount
         @receiver.balance -= @amount
       self.status = "reversed"
      end
    end

   def reject_transfer
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
   end
    end
