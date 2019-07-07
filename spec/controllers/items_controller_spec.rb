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
end