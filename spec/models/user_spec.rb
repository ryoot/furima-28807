require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe 'ユーザー新規登録' do
      it "全て入力されていれば登録できる" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
      it "nicknameが空なら登録できない" do
        user = FactoryBot.build(:user, nickname: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空なら登録できない" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが意図しない形なら登録できない" do
        user = FactoryBot.build(:user, email: "aaagmail.com")
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが重複していたら登録できない" do
        user1 = FactoryBot.create(:user)
        expect(FactoryBot.build(:user, email: user1.email)).to_not be_valid
      end
      it "passwordが空なら登録できない" do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字よりも短ければ登録できない" do
        user = FactoryBot.build(:user, password: "aaa11")
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字のみなら登録できない" do
        user = FactoryBot.build(:user, password: "aaaaaa")
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it "passwordが半角数字のみなら登録できない" do
        user = FactoryBot.build(:user, password: "111111")
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
  
      it "first_nameが空なら登録できない" do
        user = FactoryBot.build(:user, first_name: nil)
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_nameが空なら登録できない" do
        user = FactoryBot.build(:user, family_name: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_name_kanaが空ならNG" do
        user = FactoryBot.build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "family_name_kanaが空なら登録できない" do
        user = FactoryBot.build(:user, family_name_kana: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "birthdayが空なら登録できない" do
        user = FactoryBot.build(:user, birthday: nil)
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
