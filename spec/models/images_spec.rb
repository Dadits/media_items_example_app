require 'rails_helper'

describe Image do
  let(:image) { create(:image) }

  describe "validations" do

    subject { image }
    it { should be_valid }
    it { should belong_to(:media_item) }
    it { should have_attached_file(:file) }
    it { should validate_attachment_presence(:file) }
    it { should validate_attachment_content_type(:file).allowing('image/png', 'image/jpg').rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:file).less_than(2.megabytes) }

  end

end