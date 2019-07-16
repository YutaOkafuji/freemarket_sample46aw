require 'rails_helper'

RSpec.describe Item_detail, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
    end

    # 必須項目にデータがあれば保存できる
    it "is valid with a size_id, condition_id, brand" do
      @item.item_detail = build(:item_detail)
      expect(@item.item_detail).to be_valid
    end

    # 商品状態が空の場合だと登録できない
    it "is invalid without a condition_id" do
      @item.item_detail = build(:item_detail, condition_id: "")
      @item.item_detail.valid?
      expect(@item.item_detail.errors[:condition_id]).to include("can't be blank")
    end

  end
end