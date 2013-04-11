require 'spec_helper'

describe "Static Pages" do

  subject { page }

  #jay variables
  all_static_pages = "all static pages"
  help_page_title = "Help"
  about_page_title = "About Us"
  contact_page_title = "Contact"
  signup_page_title = "Sign up"


  shared_examples_for all_static_pages do
    it {should have_selector('h1', text: heading)}
    it {should have_selector('title', text: full_title(page_title))}
  end


  describe "Home page" do
  	before { visit root_path }

    let(:heading) {'Sample App'}
    let(:page_title){''}

    it_should_behave_like all_static_pages
 
    it { should_not have_selector 'title', :text => '| Home'}
 
  end

  describe "Help page" do
  	before { visit help_path}

    
    let(:heading) { help_page_title}
    let(:page_title){ help_page_title}

    it_should_behave_like all_static_pages


  	end

  describe "About page" do
  	before{ visit about_path}

    

    let(:heading){ about_page_title}
    let(:page_title) { about_page_title}

    it_should_behave_like all_static_pages


  end

  describe "Contact page" do
    before { visit contact_path }

    

    let(:heading) { contact_page_title}
    let(:page_title) { contact_page_title}

    it_should_behave_like all_static_pages
   
  end

  describe "Signup page" do
    before { visit signup_path}

    let(:heading){signup_page_title}
    let(:page_title){signup_page_title}

    it_should_behave_like all_static_pages


  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title(about_page_title)

    click_link "Help"
    page.should have_selector 'title', text: full_title(help_page_title)
    
    click_link "Contact"
    page.should have_selector 'title', text: full_title(contact_page_title)

    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title(signup_page_title)

    click_link "sample app"
    page.should have_selector 'h1', text: 'Sample App'
  end



end


