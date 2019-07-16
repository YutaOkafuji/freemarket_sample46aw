require 'rails_helper'

RSpec.describe Item_image, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
    end

    # 必須項目にデータがあれば保存できる
    it "is valid with a image" do
      @item.item_image = FactoryBot.build(:item_image).attributes
      expect(@item.item_image).to be_valid
    end

    # 画像が空の場合だと登録できない
    it "is invalid without a image" do
      @item.item_image = build(:item_image, image: "")
      @item.item_image.valid?
      expect(@item.item_image.errors[:image]).to include("can't be blank")
    end

  end
end