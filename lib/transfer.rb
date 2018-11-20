class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == 'pending'
      if self.sender.balance > amount
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = 'complete'
      else
        "Transaction rejected. Please check your account balance."
        self.status = 'rejected'
      end
    end
  end
end
