require 'rails_helper'

RSpec.describe User, type: :model do


  before do
    @user = FactoryBot.build(:user)

  end





  describe 'ユーザー新規登録' do
    
    context '新規登録できるとき' do
    it "nicknameとemail,passwordとpassword_confirmation,お名前（全角）とお名前カナ（全角）,生年月日が存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'a1234567'
      @user.password_confirmation = 'a1234567'
      expect(@user).to be_valid

    end
  end
    context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したメールアドレスは登録できない' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end


      it 'パスワードが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = "AAAAa1あ"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it '姓（全角）が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end


      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = "aaaa"
        @user.valid?
       
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end


      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end


      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end


      it '姓（カナ）が空だと登録できない' do
        @user.family_name_zenkaku_katakana = ''
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Family name zenkaku katakana can't be blank")
      end


      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_zenkaku_katakana = '青'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name zenkaku katakana is invalid")
      end

      it '名（カナ）が空だと登録できない' do
        @user.first_name_zenkaku_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku katakana can't be blank")
      end


      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_zenkaku_katakana = '青'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku katakana is invalid")
      end

      it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end