require 'rails_helper'

describe Link do
  let(:link) { create(:link) }

  describe "validations" do

    subject { link }
    it { should be_valid }
    it { should belong_to(:media_item) }
    it { should allow_value("http://youtube.com").for(:url) }
    it { should_not allow_value("foo").for(:url) }
    it { should validate_presence_of(:link_type) }
  end

end