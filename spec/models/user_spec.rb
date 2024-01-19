require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail,passwordとpassword_confirmation,name_first,name_secound,name_first_kana,name_secound_kana,birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameでは登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが同じでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'example.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは、半角英数字混合での入力でないと登録できない' do
        @user.password = 'hogehoge'
        @user.password_confirmation = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test-1234'
        @user.password_confirmation = 'test-12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'name_firstが空だと登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it 'name_firstが全角でないと登録できない' do
        @user.name_first = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end
      it 'name_secoundが空だと登録できない' do
        @user.name_secound = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name secound can't be blank")
      end
      it 'name_secoundが全角でないと登録できない' do
        @user.name_secound = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name secound is invalid')
      end
      it 'name_first_kanaが空だと登録できない' do
        @user.name_first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana can't be blank")
      end
      it 'name_first_kanaがカタカナでないと登録できない' do
        @user.name_first_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first kana is invalid')
      end
      it 'name_secound_kanaが空だと登録できない' do
        @user.name_secound_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name secound kana can't be blank")
      end
      it 'name_secound_kanaがカタカナでないと登録できない' do
        @user.name_secound_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name secound kana is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
