class Sale < ActiveRecord::Base
	belongs_to :customer
	belongs_to :funcionario
	has_many :line_items, dependent: :destroy
	has_many :items, :through => :line_items
	has_many :payments, dependent: :destroy

	accepts_nested_attributes_for :line_items, :allow_destroy => true
	accepts_nested_attributes_for :items, :allow_destroy => true
	accepts_nested_attributes_for :payments, :allow_destroy => true


	def self.total_on(date)
    	where("date(created_at) = ?",date).sum(:total_amount)
  	end

	
	def zero
		0.00
	end

	def remaining_balance
		balance = self.total_amount.blank? ? zero : remaining_to_pay
		balance < 0 ? zero : balance.round(2)
	end	

	def remaining_to_pay
		self.total_amount - paid_total
	end

	def get_discounted_amount
		self.total_amount * self.discount
	end

	def paid_total
		paid_total = zero
		self.payments.each do |payment|
			paid_total += payment.amount || zero
		end
		paid_total
	end

	def difference_between_paid_and_total
		paid_total - self.total_amount
	end

	def change_due
		return zero if self.total_amount.blank? || difference_between_paid_and_total < 0
		difference_between_paid_and_total
	end

	def add_customer customer_id
		self.update_attributes(customer_id: customer_id)
	end

end