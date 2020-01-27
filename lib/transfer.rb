# require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    !self.sender.valid? || !self.receiver.valid? ? false : true
  end

  def execute_transaction
    if self.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    end
  end

end
