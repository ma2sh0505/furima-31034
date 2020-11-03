require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全て入力されていると登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dayが空では登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "emailに@が無い場合は登録できない" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordは半角英数混合で入力が必要である" do
      @user.password = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザーfamily_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = "TANAKA"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "ユーザーfirst_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "ICHORO"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザーfamily_name_kanaのフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.family_name_kana = "たなか"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "ユーザーfirst_name_kanaは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana ="いちろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "passwordは半角数字のみでは登録できない" do
      @user.password = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end