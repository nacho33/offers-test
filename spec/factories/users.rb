FactoryGirl.define  do

  factory :user do 
    sequence(:email) { |i| "user#{i}@rtest.com"}
    password '000000'
    password_confirmation '000000'
    sequence(:username) { |i| "user#{i}"}
    role "user"
  end
  
  factory :user_venue, class: 'User'  do 
    sequence(:email) { |i| "venue#{i}@rtest.com"}
    password '000000'
    password_confirmation '000000'
    sequence(:username) { |i| "venue#{i}"}
    role "venue"
  end

  factory :user_admin, class: 'User'  do 
    sequence(:email) { |i| "admin#{i}@rtest.com"}
    password '000000'
    password_confirmation '000000'
    sequence(:username) { |i| "admin#{i}"}
    role "admin"
  end

  factory :empty_user, class: 'User'  do 
    
  end

end