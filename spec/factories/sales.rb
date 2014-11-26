FactoryGirl.define do
  factory :sale do  	
  	association :customer
  	association :funcionario
	amount { 10}
	total_amount { 20}
	remaining_amount { 5}
	discount { 0}
	tax { 0 }
	comments { "teste" }
end
end





	
