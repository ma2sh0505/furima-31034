require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
  @order = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "全て入力されていると購入できる" do
        expect(@order).to be_valid
      end  
      it "building_numberが空でも購入できる" do
      @order.building_number = nil
       expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "tokenが空なら購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空なら購入できない" do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeにはハイフンが入っていなければならない" do
        @order.post_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it "prefectureが選択されてなければ購入できない" do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空なら購入できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空なら購入できない" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it "phon_numberが空では購入できない" do
        @order.phon_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phon number can't be blank")
      end 
      it "phon_numberが11桁以上では購入できない" do
        @order.phon_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phon number is invalid")
      end 
      it "phon_numberにハイフンが入っていると購入できない" do
        @order.phon_number = "090-1234-5678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phon number is invalid")
      end 
    end
  end
end
