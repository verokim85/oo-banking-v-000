class Transfer

attr_accessor :transfer, :sender, :status, :receiver, :amount

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @status = "pending"
    @receiver = receiver
  end

  def valid?
    if receiver.valid? && sender.valid?
      return true
    end
  end

  def execute_transaction
    if self.status == "pending"
      if sender.valid? && sender.balance > @amount
          sender.balance = sender.balance - @amount
          receiver.balance = receiver.balance + @amount
          self.status = "complete"
        elsif self.valid? == false
           self.status = "rejected"
           return "Transaction rejected. Please check your account balance."
      end
    end
  end



end
