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
    if @sender.valid? && @receiver.valid?  || @sender.status = "pending" && @receiver.status = "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
