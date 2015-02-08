require 'rails_helper'

describe MediaItem do
  let(:user) { create(:user) }
  let(:media_item) { create(:media_item, user: user) }

  describe "validations" do

    subject { media_item }
    it { should be_valid }
    it { should belong_to(:user) }
    it { should have_many(:images) }
    it { should have_one(:link) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :user_id }
    it { should validate_inclusion_of(:media_type).in_array(MediaItem::MEDIA_TYPES) }    
    context 'when link' do
      it { should validate_presence_of :link }
      it { should_not validate_presence_of :images }
    end
  end

end