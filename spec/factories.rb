FactoryGirl.define do
	factory :user do
		name 									 "Yacht Club"
		email 								 "yacht@gmail.com"
		password               "yachts"
		password_confirmation  "yachts"
	end
end