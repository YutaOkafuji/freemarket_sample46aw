require 'rails_helper'

RSpec.describe Shipping_origin, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
    end

    # 必須項目にデータがあれば保存できる
    it "is valid with a size_id, condition_id, brand" do
      @item.shipping_origin = build(:shipping_origin)
      expect(@item.shipping_origin).to be_valid
    end

    # 都道府県が空の場合だと登録できない
    it "is invalid without a prefecture_id" do
      @item.shipping_origin = build(:shipping_origin, prefecture_id: "")
      @item.shipping_origin.valid?
      expect(@item.shipping_origin.errors[:prefecture_id]).to include("can't be blank")
    end

    # 配送日程が空の場合だと登録できない
    it "is invalid without a delivery_date_id" do
      @item.shipping_origin = build(:shipping_origin, delivery_date_id: "")
      @item.shipping_origin.valid?
      expect(@item.shipping_origin.errors[:delivery_date_id]).to include("can't be blank")
    end

    # 配送方法が空の場合だと登録できない
    it "is invalid without a condition_id" do
      @item.shipping_origin = build(:shipping_origin, delivery_method_id: "")
      @item.shipping_origin.valid?
      expect(@item.shipping_origin.errors[:delivery_method_id]).to include("can't be blank")
    end

    # 送料負担が空の場合だと登録できない
    it "is invalid without a condition_id" do
      @item.shipping_origin = build(:shipping_origin, burden_id: "")
      @item.shipping_origin.valid?
      expect(@item.shipping_origin.errors[:burden_id]).to include("can't be blank")
    end

  end
end
