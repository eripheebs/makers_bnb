def sign_up_correctly
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_mismatch_passwords
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'not_matching'
  click_button 'Sign up'
end

def sign_up_no_email
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_invalid_email
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmailcom'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_same_email
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def log_in_correctly
  visit '/log-in'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Log in'
end

def log_in_incorrectly
  visit '/log-in'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'jazzyiscool'
  click_button 'Log in'
end

def add_space
  visit '/new/space'
  fill_in :name, with: "chris's space"
  fill_in :description, with: "a lovely calming space"
  fill_in :price, with: "£20 per night"
  click_button('submit')
end
