require 'rails_helper'

RSpec.describe Merchandise, type: :model do
  before do
    @merchandise = FactoryBot.build(:merchandise)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'imageとnameとexplanation,category_idとcondition_id,prefecture_id,shipping_day_id,shipping_load_id,priceがあれば登録できる' do
        expect(@merchandise).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空だと保存できない' do
        @merchandise.image = nil
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと保存できない' do
        @merchandise.name = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字以上だと保存できない' do
        @merchandise.name = 'test' * 11
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'explanationが空だと保存できない' do
        @merchandise.explanation = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1000文字以上だと保存できない' do
        @merchandise.explanation = 'test' * 1000
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'category_idが空だと保存できない' do
        @merchandise.category_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが初期値だと保存できない' do
        @merchandise.category_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと保存できない' do
        @merchandise.condition_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Condition can't be blank")
      end
      it 'category_idが初期値だと保存できない' do
        @merchandise.condition_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_load_idが空だと保存できない' do
        @merchandise.shipping_load_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Shipping load can't be blank")
      end
      it 'shipping_load_idが初期値だと保存できない' do
        @merchandise.shipping_load_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Shipping load can't be blank")
      end
      it 'shipping_day_idが空だと保存できない' do
        @merchandise.shipping_day_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'shipping_day_idが初期値だと保存できない' do
        @merchandise.shipping_day_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'prefecture_idが空だと保存できない' do
        @merchandise.prefecture_id = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_day_idが初期値だと保存できない' do
        @merchandise.prefecture_id = 1
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空だと保存できない' do
        @merchandise.price = ''
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数値以外だと保存できない' do
        @merchandise.price = 'test'
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが300円以下だと保存できない' do
        @merchandise.price = 299
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9999999円以上だと保存できない' do
        @merchandise.price = 10_000_000
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include('Price is not included in the list')
      end
      it 'userが紐付いていないと保存できない' do
        @merchandise.user = nil
        @merchandise.valid?
        expect(@merchandise.errors.full_messages).to include('User must exist')
      end
    end
  end
end
