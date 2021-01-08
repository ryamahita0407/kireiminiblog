require 'rails_helper'

RSpec.describe Miniblog, type: :model do
  before do
    @miniblog = FactoryBot.build(:miniblog)
  end

  describe 'ミニブログの保存' do
    context "ミニブログが投稿できる場合" do
      it "画像とタイトルとテキストがあれば投稿できる" do
        expect(@miniblog).to be_valid
      end
    end
    context "ミニブログが投稿できない場合" do
      it "画像が空では投稿できない" do
        @miniblog.images = nil
        @miniblog.valid?
        expect(@miniblog.errors.full_messages).to include("Images can't be blank", "Images You can upload 2 images")
      end
      it "タイトルが空では投稿できない" do
        @miniblog.title = ""
        @miniblog.valid?
        expect(@miniblog.errors.full_messages).to include("Title can't be blank")
      end
      it "テキストが空では投稿できない" do
        @miniblog.text = ""
        @miniblog.valid?
        expect(@miniblog.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @miniblog.user = nil
        @miniblog.valid?
        expect(@miniblog.errors.full_messages).to include("User must exist")
      end
    end
  end
end