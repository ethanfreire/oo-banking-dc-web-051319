require "pry"
class Transfer
  # your code here
  attr_accessor :amount, :sender, :receiver, :status

  def initialize (sender , receiver , amount)

    @sender = sender
    @receiver = receiver
    @amount = amount
    @status =  "pending"

  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @sender.balance - @amount > 0 && self.status == "pending"
      @receiver.balance += amount
      @sender.balance -= amount
      return self.status = "complete"

    elsif  @sender.balance - @amount < 0
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= amount
      @sender.balance += amount
      return self.status = "reversed"
    end
  end
end
