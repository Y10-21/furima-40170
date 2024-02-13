require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '購入先住所保存' do
    context '購入先住所が保存できる' do
      it 'post_number,prefecture_id,post_city,post_address,telephone_numberがあれば購入先住所保存' do
        expect(@address).to be_valid
      end
    end
    context '購入先住所が保存できない' do
      it '郵便番号が空では登録できない' do
        @address.post_number = ''
        @address.valid?
        binding.pry
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @address.post_number = '1234567'
        @address.valid?
      end
    end
  end
end
