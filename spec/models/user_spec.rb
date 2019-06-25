require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    # 必須カラムにデータが存在すれば登録できること
    it "is valid with a email, password, profit and point" do
      user = build(:user)
      p user
      expect(user).to be_valid
    end

    # passwordの文字数が6文字以上なら登録できること
    it "is valid with a password that has more than 6 characters" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordが存在しても、password_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation altough with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # profitが空では登録できないこと
    it "is invalid without a profit" do
      user = build(:user, profit: "")
      user.valid?
      expect(user.errors[:profit]).to include("can't be blank")
    end

    # pointが空では登録できないこと
    it "is invalid without a point" do
      user = build(:user, point: "")
      user.valid?
      expect(user.errors[:point]).to include("can't be blank")
    end

    # 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが5文字以下なら登録できないこと
    it "is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("too short")
    end
  end
end
