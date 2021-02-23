require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it '全ての情報が入っている場合、登録できる' do
        expect(@user).to be_valid
      end

      it 'メールアドレスが@を含んでいる場合、登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end

      it 'パスワードが半角英数字混合、6文字以上の場合、登録できる' do
        @user.password = 'aaAA11'
        @user.password_confirmation = 'aaAA11'
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが既に登録されている場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'メールアドレスが@を含んでいない場合、登録できない' do
        @user.email = 'testaddress'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'パスワードが空の場合、登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードが5文字以下の場合、登録できない' do
        @user.password = 'A1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'パスワードが半角英語のみの場合、登録できない' do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it 'パスワードが半角数字のみの場合、登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it 'パスワードが全角では登録できない' do
        @user.password = 'パスワード１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end

      it 'パスワード確認用が空の場合、登録できない' do
        @user.password = 'A12345'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'パスワードとパスワード確認用が異なる場合、登録できない' do
        @user.password = 'A12345'
        @user.password_confirmation = 'B12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end

  describe '新規登録/本人情報確認' do

    context '新規登録できるとき' do
      it '名前(名字)が全角（漢字・ひらがな・カタカナ）のとき登録できる' do
        @user.last_name = 'てすと'
        expect(@user).to be_valid
      end

      it '名前(名前)が全角（漢字・ひらがな・カタカナ）のとき登録できる' do
        @user.name = 'てすと'
        expect(@user).to be_valid
      end

      it '名前(名字 - カナ)が全角（カタカナ）のとき登録できる' do
        @user.last_name_kana = 'テスト'
        expect(@user).to be_valid
      end

      it '名前(名字 - カナ)が全角（カタカナ）のとき登録できる' do
        @user.name_kana = 'テスト'
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do
      it '名前(名字)が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it '名前(名前)が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it '名前(名字)が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = '11'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name は全角文字を使用してください"
      end

      it '名前(名前)が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.name = '11'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name は全角文字を使用してください"
      end

      it '名前(名字 - カナ)が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it '名前(名前 - カナ)が空では登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name kana can't be blank"
      end

      it '名前(名字 - カナ)が全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = '11'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana は全角カナを使用してください"
      end

      it '名前(名前 - カナ)が全角（カタカナ）以外では登録できない' do
        @user.name_kana = '11'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name kana は全角カナを使用してください"
      end

      it '名前(名字 - カナ)がカタカナ以外の全角文字は登録できない' do
        @user.last_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana は全角カナを使用してください"
      end

      it '名前(名前 - カナ)がカタカナ以外の全角文字は登録できない' do
        @user.name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name kana は全角カナを使用してください"
      end

      it '誕生日が空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end
