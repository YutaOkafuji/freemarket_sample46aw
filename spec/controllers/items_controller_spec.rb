require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "#destroy" do
    context "as an authorized user do"
      before do 
        @user = create(:user)
        @item = create(:item, owner: @user)
      end
    end
  end
end
