require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#create' do
    before do
      @user = build(:user)
    end

    # 必須カラムにデータが存在すれば登録できること
    it "is valid with a family_name, first_name, family_name_kana, first_name_kana and user_id" do
      @user.profile = build(:profile)
      expect(@user.profile).to be_valid
    end

    # family_nameが空では登録できないこと
    it "is invalid without a family_name" do
      @user.profile = build(:profile, family_name: "")
      @user.profile.valid?
      expect(@user.profile.errors[:family_name]).to include("can't be blank")
    end

    # first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      @user.profile = build(:profile, first_name: "")
      @user.profile.valid?
      expect(@user.profile.errors[:first_name]).to include("can't be blank")
    end

    # family_name_kanaが空では登録できないこと
    it "is invalid without a family_name_kana" do
      @user.profile = build(:profile, family_name_kana: "")
      @user.profile.valid?
      expect(@user.profile.errors[:family_name_kana]).to include("can't be blank")
    end

    # first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      @user.profile = build(:profile, first_name_kana: "")
      @user.profile.valid?
      expect(@user.profile.errors[:first_name_kana]).to include("can't be blank")
    end

    # user_idが空では登録できないこと
    it "is invalid without a user_id" do
      @user.id = nil
      @user.profile = build(:profile)
      @user.profile.valid?
      expect(@user.profile.errors[:user_id]).to include("can't be blank")
    end
  end
end
