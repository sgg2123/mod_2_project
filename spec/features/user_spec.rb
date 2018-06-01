require 'spec_helper'


describe 'navigate_user' do
  before do
    count = User.all.count
    @user = User.create(name: "Louis", username: "imposter", password: "123456")
  end
  it 'creates a new user' do
    expect(count).to not_equal(User.all.count)
  end

  it 'loads the show page' do
    visit "/users/#{@user.id}"
    expect(page.status_code).to eq(200)
  end

  it 'has a name' do
    expect(@user.name).to not_equal(nil)
  end

  it 'has a username' do
    expect(@user.username).to not_equal(nil)
  end



end


describe 'count' do
  before do
    count = 2
  end
  it 'makes sure that count is 2' do
    expect(2).to equal(2)
  end
end


describe 'form' do
  it 'shows a new form that submits content and redirects and prints out params' do
    visit new_user_path

    fill_in 'name', with: "Louis"
    fill_in 'username', with: "imposter"
    fill_in 'password', with: "password"

    click_on "Create User"

    expect(page).to have_content("imposter")
  end
end
