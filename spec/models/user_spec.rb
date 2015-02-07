require 'rails_helper'

describe User do
  let(:user) { create(:user) }

  describe "validations" do

    subject { user }
    it { should be_valid }
    it { should have_many(:media_items) }

  end

end
