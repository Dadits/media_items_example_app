require 'rails_helper'

describe 'manage items' do

  #TODO add tests for item creation
  #problem here with Phantom JS, always timeout
  #current coverage ~ 94%

  before do
    login
  end

  context 'my items' do
    
    before do
      @item = create(:media_item, user: @user)
      visit root_path
      click_link 'Manage Media Items'
    end
    
    it 'shows my media items' do
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.link.url)
    end
    
    it 'removes item' do
      expect(@user.media_items.count).to eq 1
      first(:link, 'Remove item').click
      expect(@user.media_items.count).to eq 0
      expect(page).to have_content 'Media Item successfuly removed'
    end
    
    context 'search' do
      
      it 'filters out searched items by name' do
        expect(page).to have_content @item.name
        within('#media_item_search') do
          find('#q_name_cont').set('foobar')
          find(:button, 'Search').click
        end
        expect(page).to_not have_content @item.name
      end

      it 'filters out searched items by type' do
        expect(page).to have_content @item.name
        within('#media_item_search') do
          find('#q_name_cont').set('foobar')
          select 'image', from: "q_media_type_eq"
          find(:button, 'Search').click
        end
        expect(page).to_not have_content @item.name
      end

      it 'shows correct found result' do
        expect(page).to have_content @item.name
        within('#media_item_search') do
          find('#q_name_cont').set(@item.name)
          find(:button, 'Search').click
        end
        expect(page).to have_content @item.name
      end
      
    end
    
    context 'edit' do
    
      before do
        find(:link, 'Home').click
        expect(page).to_not have_content @item.name
        find(:link, 'Manage Media Items').click
        first(:link, 'Edit item').click
      end
    
      it 'updates item and shows in shared' do
        fill_in 'Name', with: 'New link'
        fill_in 'Url', with: 'https://foobar.com'
        check 'Shared'
        click_button 'Update Media item'
        expect(page).to have_content 'Media Item successfuly updated'
        expect(page).to have_content 'New link'
        expect(page).to have_content 'https://foobar.com'
        find(:link, 'Home').click
        expect(page).to have_content 'New link'
      end
      
    end
    
    
  end

end