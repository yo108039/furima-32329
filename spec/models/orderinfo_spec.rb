require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '商品購入機能テスト' do
    before do
      @order_info = FactoryBot.build(:order_info)
      @order_info.user_id = 1
      @order_info.item_id = 1
    end

    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
       expect(@order_info).to be_valid
      end

      it '建物名が抜けていても購入ができること' do
        @order_info.delivery_building_name = nil
        expect(@order_info).to be_valid
       end
 
    end

    context '商品出品が購入できないとき' do
      it 'ユーザーが存在しない場合、購入できない' do
        @order_info.user_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "User can't be blank"
      end

      it '購入対象が存在しない場合、購入できない' do
        @order_info.item_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Item can't be blank"
      end

      it 'トークンが空の場合、購入できない' do
        @order_info.token = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号が入力されていない場合、購入できない' do
        @order_info.delivery_mail_num = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery mail num can't be blank"
      end

      it '郵便番号にハイフンが含まれていない場合、購入できない' do
        @order_info.delivery_mail_num = "1234567"
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery mail num はハイフンを使用してください"
      end

      it '都道府県が---の場合、購入できない' do
        @order_info.delivery_area_id = 1
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery area must be other than 1"
      end

      it '市区町村が入力されていない場合、購入できない' do
        @order_info.delivery_shikutyouson = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery shikutyouson can't be blank"
      end

      it '番地が入力されていない場合、購入できない' do
        @order_info.delivery_numbering = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery numbering can't be blank"
      end

      it '電話番号が入力されていない場合、購入できない' do
        @order_info.delivery_telephone = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery telephone can't be blank"
      end

      it '電話番号が12桁以上の場合、購入できない' do
        @order_info.delivery_telephone = "090123456789"
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery telephone は11桁以内数字を使用してください"
      end

      it '電話番号が数字以外の場合、購入できない' do
        @order_info.delivery_telephone = "テスト"
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery telephone は11桁以内数字を使用してください"
      end

      it '電話番号が英数字混合では、購入できない' do
        @order_info.delivery_telephone = "0A012345678"
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include "Delivery telephone は11桁以内数字を使用してください"
      end

    end
  end
end
