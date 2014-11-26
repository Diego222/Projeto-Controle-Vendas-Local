require 'spec_helper'

describe Sale do 
	let(:sale) { create(:sale, total_amount: 20, discount: 0.05) }
	
	describe '#zero' do
		it 'returns zero' do 
			expect(sale.zero).to eq 0.0
		end
	end

	describe '#remaining_to_pay' do		
		it 'returns the amount left to pay' do
			Sale.any_instance.should_receive(:paid_total).and_return(10)
			expect(sale.remaining_to_pay).to eq 10
		end
	end

	describe '#get_discounted_amount' do
		it 'returns the discounted value' do 
			expect(sale.get_discounted_amount).to eq 1
		end
	end

	describe '#change_due' do
		context 'when total_amount is nil' do
			let(:sale_2) { create(:sale, total_amount: nil) }
			it 'returns zero' do
				expect(sale_2.change_due).to eq 0.0
			end
		end
	end
	


		describe '#change_due' do
			context 'when difference between paid and total < 0' do
				let(:sale_3) { create(:sale, total_amount: 10) }
				it 'returns zero' do
					Sale.any_instance.should_receive(:paid_total).and_return(5)
					expect(sale_3.change_due).to eq 0.0
				end
			end
		end
		

		describe '#difference_between_paid_and_total' do
			let(:sale_4) { create(:sale, total_amount: 10) }
			it 'returns difference' do
				Sale.any_instance.should_receive(:paid_total).and_return(5)
				expect(sale_4.difference_between_paid_and_total).to eq -5
			end
		end

		describe '#remaining_balance' do
			let(:sale_5) { create(:sale, total_amount: 20)}
			it 'returns remaining balance' do
				Sale.any_instance.should_receive(:paid_total).and_return(20)
				expect(sale_5.remaining_balance).to eq 0.0
			end
		end
end