require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user_1 = User.create!(email: "user_1@testemail.com", password: "user111")
    @user_2 = User.create!(email: "user_2@testemail.com", password: "user222")
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user_1
      end

      it 'loads correct user details' do
        get :show, params: {id: @user_1.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user_1
      end

      it 'cannot access other user show page' do
        get :show, params: {id: @user_2.id}
        expect(response).to redirect_to(root_path)
      end
    end


    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user_1.id }
        expect(response).to redirect_to(root_path)
      end
    end

  end

end
