require 'rails_helper'

RSpec.feature 'login in ', type: :feature  do
  background do
  end


  scenario 'the login page exists' do
    visit new_user_session_path 
  end
end
