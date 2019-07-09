require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#create' do
    before do
      @user = build(:user)
    end

    # 必須カラムにデータが存在すれば登録できること
    it "is valid with a nickname, family_name, first_name, family_name_kana and first_name_kana" do
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

    # nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      @user.profile = build(:profile, nickname:"")
      @user.profile.valid?
      expect(@user.profile.errors[:nickname]).to include("can't be blank")
    end

    # nicknameの文字数が21文字以上では登録できないこと
    it "is invalid with a nickname that has more than 21 characters " do
      @user.profile = build(:profile, nickname: "123456789012345678901")
      @user.profile.valid?
      expect(@user.profile.errors[:nickname][0]).to include("is too long")
    end

    # nicknameの文字数が20文字以下なら登録できること
    it "is valid with a nickname that has less than 20 characters" do
      @user.profile = build(:profile, nickname:"12345678901234567890")
      expect(@user.profile).to be_valid
    end
  end
end
