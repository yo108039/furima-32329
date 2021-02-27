require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do 
    context '商品出品ができるとき' do
      it '全ての情報が入っている場合、登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '画像が添付されていない場合、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'ユーザーが紐づいていない場合、登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

      it '商品名が空の場合、登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品詳細が空の場合、登録できない' do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end

      it 'カテゴリーが空の場合、登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が空の場合、登録できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '配送料の負担が空の場合、登録できない' do
        @item.delivery_price_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price can't be blank"
      end

      it '発送元の地域が空の場合、登録できない' do
        @item.delivery_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end

      it '発送までの日数が空の場合、登録できない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end

      it 'カテゴリーに1(---)を選択した場合、登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '商品の状態に1(---)を選択した場合、登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end

      it '配送料の負担に1(---)を選択した場合、登録できない' do
        @item.delivery_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery price must be other than 1"
      end

      it '発送元の地域に1(---)を選択した場合、登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area must be other than 1"
      end

      it '発送までの日数に1(---)を選択した場合、登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day must be other than 1"
      end

      it '価格が空の場合、登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格の範囲が¥300未満の場合、登録できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格の範囲が¥10,000,000以上の場合、登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it '価格が半角数字以外の場合、登録できない' do
        @item.price = "テスト"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

    end

  end



end
