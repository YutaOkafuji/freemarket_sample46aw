require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'Delete #destroy' do
    before :each do
      @user = create(:user)
      @item = create(:item, user_id: @user.id)
      login_user @user
    end

    it 'gets accurate request' do
      delete :destroy, params: {user_id: @item.user_id, id: @item.id}
      expect(response.status).to eq(302)
    end

    it 'deletes item intended to' do
      expect{
        delete :destroy, params: {user_id: @item.user_id, id: @item.id}
      }.to change(Item, :count).by(-1)
    end

    it 'redirects to the accurate request' do
      delete :destroy, params: {user_id: @item.user_id, id: @item.id}
      expect(response).to redirect_to root_path
    end
  end

  describe 'Get #edit' do
    before :each do
      @user = create(:user)
      @item = create(:item, user_id: @user.id)
      login_user @user
    end

    it 'gets accurate request' do
      get :edit, params: { id: @item.id }
      expect(response.status).to eq(200)
    end
  end

  describe "#update" do
    before :each do
      @user = create(:user)
      @item = create(:item, user_id: @user.id)
      login_user @user
    end

    it "updates an item" do
      item_params = FactoryBot.attributes_for(:item,
        name: "New Item Name")
      patch :update, params:{id: @item.id, item: item_params}
      expect(@item.reload.name).to eq "New Item Name"
    end

    it "redirects to the item_page" do
      item_params = FactoryBot.attributes_for(:item)
      patch :update, params: { id: @item.id, item: item_params }
      expect(response).to redirect_to item_path(@item)
    end
  end

  describe 'GET #show' do
    before :each do
      @user = create(:user)
      @item = create(:item, user_id: @user.id)
      # login_user @user
    end

    it 'gets accurate request' do
      get :show, params: {id: @item.id}
      expect(response.status).to eq(200)
    end
  end
end
