require 'spec_helper'

describe UsersController do

  describe 'GET #edit' do
    let(:user) { FactoryGirl.create(:user) }

    context 'renders the edit template' do
      before(:each) do
        xhr :get, :edit, id: user
      end

      it { assigns(:user).should eq(user) }
      it { expect(response).to be_success }
      it { expect(response.status).to eq(200) }
      it { expect(response).to render_template('edit') }
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @user = FactoryGirl.create(:user, first_name: 'Lawrence', last_name: 'Smith')
    end

    context 'with valid params' do

      it 'user the requested @user' do
        xhr :put, :update, id: @user
        assigns(:user).should eq(@user)
      end

      it 'changes @user attributes' do
        xhr :put, :update, id: @user, user: FactoryGirl.attributes_for(:user, first_name: 'Larry', last_name: 'Smith')
        @user.reload
        @user.first_name.should eq('Larry')
        @user.last_name.should eq('Smith')
      end
    end

    context 'with invalid params' do

      it 'does not change @user attributes' do

      end
    end
  end

end
