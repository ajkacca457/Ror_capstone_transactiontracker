require 'rails_helper'
RSpec.describe Group, type: :model do
  let(:title_invalid) { Group.new(icon: 'test', user_id: 1) }
  let(:icon_invalid) { Group.new(title: 'test title', user_id: 1) }
  let(:id_invalid) { Group.new(title: 'test title', icon: 'myicon') }

  context 'Association Test' do
    it 'belongs to users' do
      expect(Group.reflect_on_association(:user).macro).to be :belongs_to
    end
    it 'has many transactions' do
      expect(Group.reflect_on_association(:transactions).macro).to be :has_many
    end
  end

  context 'Validations tests' do
    it 'return false if title is invalid or not given' do
      expect(title_invalid.valid?).to eq(false)
    end

    it 'Returns false when the Description is not present' do
      expect(icon_invalid.valid?).to eq(false)
    end

    it 'Returns false when the id is not present' do
      expect(id_invalid.valid?).to eq(false)
    end
  end
end
