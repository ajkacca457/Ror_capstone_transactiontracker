require 'rails_helper'
RSpec.describe Transaction, type: :model do
  let(:title_invalid) { Transaction.new(amount: 120,user_id: 1) }
  let(:amount_invalid) { Transaction.new(title: 'test title', user_id: 1) }
  let(:id_invalid) { Transaction.new(title: 'test title', amount: 120) }

  context 'Association Test' do

    it 'belongs to users' do
      expect(Transaction.reflect_on_association(:user).macro).to be :belongs_to
    end
    it 'might belong to groups' do
      expect(Transaction.reflect_on_association(:group).macro).to be :belongs_to
    end

  end

  context 'Validations tests' do
    it 'return false if title is invalid or not given' do
      expect(title_invalid.valid?).to eq(false)
    end

    it 'Returns false when the Description is not present' do
      expect(amount_invalid.valid?).to eq(false)
    end


    it 'Returns false when the id is not present' do
      expect(id_invalid.valid?).to eq(false)
    end
  end
end
