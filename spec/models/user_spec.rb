require 'spec_helper'

describe User do
  context 'validation' do
    subject { FactoryGirl.create(:user) }

    context 'valid' do
      it { should be_valid }
    end

    context 'invalid' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_uniqueness_of(:email) }
    end
  end
end
