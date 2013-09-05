require 'spec_helper'

describe User do
	before {@user = User.new(name: "Bob", email: "bob@email.com", password: "foobar",
                          password_confirmation: "foobar")}
	# create user
	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
	
  it { should be_valid }


	describe "when user not present" do
		before {@user.name = ""}
		it {should_not be_valid}
	end

	describe "when email not present" do
		before {@user.email = ""}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before {@user.name = "a"*51 }
		it { should_not be_valid}
	end

	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

   describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
  end

  describe "when password is not present" do
    before {@user.password = "", @user.password_confirmation=""}
    it {should_not be_valid}
  end

  describe "when password doesn't match confirmation" do 
    before {@user.password_confirmation= "mismatch"}
    it {should_not be_valid}
  end









	
end
