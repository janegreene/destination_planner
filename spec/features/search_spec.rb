require 'rails_helper'

describe "user sees a destination" do
  it "clicks on the destination from the home page" do
    destination = Destination.create!(
        name: 'Boston',
        zip: Faker::Address.zip,
        description: Faker::Lorem.sentence,
        image_url: Faker::Placeholdit.image
      )
    destination1 = Destination.create!(
        name: 'Detriot',
        zip: Faker::Address.zip,
        description: Faker::Lorem.sentence,
        image_url: Faker::Placeholdit.image
      )
      visit root_path

      within('.row') do
        click_on 'Show', match: :first
      end
      expect(current_path).to eq(destination_path(destination))
      expect(page).to have_content(destination.name)
      expect(page).to have_content(destination.description)
      expect(page).to have_content(destination.zip)

      expect(page).to have_css('.current')
      current = find('.current').text
      expect(current).not_to be_empty

      expect(page).to have_css('.high_temp')
      high_temp = find('.high_temp').text
      expect(high_temp).not_to be_empty

      expect(page).to have_css('.low_temp')
      low_temp = find('.low_temp').text
      expect(low_temp).not_to be_empty

      expect(page).to have_css('.summary')
      summary = find('.summary').text
      expect(summary).not_to be_empty

      expect(page).to have_css('.date')
      date = find('.date').text
      expect(date).not_to be_empty
  end

end
