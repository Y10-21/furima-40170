require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    merchandise = FactoryBot.create(:merchandise, user: user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, merchandise_id: merchandise.id)
  end

  describe '購入先住所保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'post-buildingは空でも保存できること' do
        @purchase_address.post_building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できないこと' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank", "Post number is invalid")
      end
      it 'post_numberは、「3桁ハイフン4桁」の半角文字列意外だと保存できないこと' do
        @purchase_address.post_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'post_cityが空だと保存できないこと' do
        @purchase_address.post_city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post city can't be blank")
      end
      it 'post_addressが空だと保存できないこと' do
        @purchase_address.post_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10文字以下だと保存できないこと' do
        @purchase_address.telephone_number = '1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it 'telephone_numberが11文字以上だと保存できないこと' do
        @purchase_address.telephone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
      it 'telephone_numberが半角数値以外だと保存できないこと' do
        @purchase_address.telephone_number = 'testtesttes'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is not a number")
      end
    end
  end
end
