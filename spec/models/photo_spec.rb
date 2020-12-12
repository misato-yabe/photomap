require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe '写真投稿機能'do
    before do
      @photo = FactoryBot.build(:photo)
    end

    describe '写真の投稿がうまくいくとき' do
      it '必要な情報を適切に入力すると、写真の投稿ができること' do
        expect(@photo).to be_valid
      end

      it 'commentの投稿がなくても写真の投稿ができること' do
        @photo.comment = nil
        expect(@photo).to be_valid
      end
    end

    describe '写真の登録がうまくいかないとき' do
      it '写真が1枚も登録されていないとき' do
        @photo.image = nil
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空であるとき' do
        @photo.title = ''
        @photo.valid?
        expect(@photo.errors.full_messages).to include("Title can't be blank")
      end

      it 'prefectureの情報が選択されていないとき' do
        @photo.prefecture_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Prefecture 1 の選択は無効です')
      end

      it 'situationの情報が選択されていないとき' do
        @photo.situation_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Situation 1 の選択は無効です')
      end

      it 'weatherの情報が選択されていないとき' do
        @photo.month_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Month 1 の選択は無効です')
      end

      it 'cameraの情報が選択されていないとき' do
        @photo.camera_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Camera 1 の選択は無効です')
      end

      it 'lensの情報が選択されていないとき' do
        @photo.lens_id = 1
        @photo.valid?
        expect(@photo.errors.full_messages).to include('Lens 1 の選択は無効です')
      end
    end
  end
end