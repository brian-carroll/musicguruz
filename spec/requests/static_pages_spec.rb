require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(heading)) }
  end

  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Musicguruz') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) {'About Us'}
    it_should_behave_like "all static pages"
 end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) {'Contact'}
    it_should_behave_like "all static pages"
  end

  describe "Browse teachers" do
    before { visit browse_teachers_path }
    let(:heading) {'Browse Teachers'}
    it_should_behave_like "all static pages"
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "musicguruz"
    expect(page).to have_title(full_title(''))
  end
  
end