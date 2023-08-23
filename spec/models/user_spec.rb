require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context '新規登録できるとき' do
      it '全ての項目が正しく入力されている場合' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
     
      it "emailが空では登録できない" do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
     
      it "passwordが空では登録できない" do
        @user.password = ''  # passwordの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
     
      it "first_nameが空では登録できない" do
        @user.first_name = ''  # first_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
     
      it "last_nameが空では登録できない" do
        @user.last_name = ''  # last_nameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
     
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''  # first_name_kanaの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
     
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''  # last_name_kanaの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
     
      it "birthdayが空では登録できない" do
        @user.birthday = ''  # birthdayの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
     
      it "メールアドレスが重複している場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
     
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
     
      it "パスワードが6文字未満では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
     
      it "パスワードとパスワード（確認用）が一致しない場合は登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
     
      it "パスワードが半角英字のみでは登録できない" do
        @user.password = "password"
        @user.password_confirmation = "password"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
     
      it "パスワードが半角数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      
      it "パスワードが半角英字のみでは登録できない" do
        @user.password = "パスワード123"
        @user.password_confirmation = "パスワード123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it "お名前(全角)が全角でないと登録できない" do
        @user.first_name = "Jhon"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "お名前(全角)が全角でないと登録できない" do
        @user.last_name = "oshima"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end

      it "お名前カナ(全角)がカタカナでないと登録できない" do
        @user.first_name_kana = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角（カタカナ）で入力してください"
      end

      it "お名前カナ(全角)がカタカナでないと登録できない" do
        @user.last_name_kana = "kakikukeko"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana 全角（カタカナ）で入力してください"
      end
    end
  end
end