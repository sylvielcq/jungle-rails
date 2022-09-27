require 'rails_helper'

RSpec.describe User, type: :model do

  before (:each) do
    @user = User.new(
      first_name: "Frodo", 
      last_name: "Baggins", 
      email: "frodo@middle-earth.com", 
      password: "myprecious", 
      password_confirmation: "myprecious"
      )
    @user.save!
  end
  
  describe 'Validations' do

    it "should save if all fields have valid inputs" do
      expect(User.all.count).to eq(1)
    end

    it "should not save if first name is blank" do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
    end

    it "should not save if last name is blank" do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
    end

    it "should not save if email is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it "should not save if password is blank" do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save if password confirmation is blank" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to be_present
    end

    it "should not save if email is not unique regardless of case" do
      @user1 = User.new(
      first_name: "Frodo", 
      last_name: "Baggins", 
      email: "FRODO@middle-EARTH.com", 
      password: "myprecious", 
      password_confirmation: "myprecious"
      )
      @user1.save
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it "should not save if the passwords do not match" do
      @user1 = User.new(
      first_name: "Bilbo", 
      last_name: "Baggins", 
      email: "bilbo@middle-earth.com", 
      password: "myprecious", 
      password_confirmation: "mypreciouss"
      )
      @user1.save
      expect(@user1.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not save if the password is less than 6 characters" do
      @user1 = User.new(
        first_name: "Bilbo", 
        last_name: "Baggins", 
        email: "bilbo@middle-earth.com", 
        password: "myp", 
        password_confirmation: "myp"
        )
        @user1.save
      expect(@user1.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "should not save if there is whitespace" do
      @user.email = " frodo@middle-earth.com"
      expect(@user).to_not be_valid
    end
  
  end
  
  describe '.authenticate_with_credentials' do
    
    xit "should login a user if they have valid credentials" do
      valid_user = User.authenticate_with_credentials("d@l.com", "12345")
      expect(valid_user).to eq(@user)
    end

    xit "should not login user if email is incorrect" do
      valid_user = User.authenticate_with_credentials("da@l.com", "12345")
      expect(valid_user).to_not eq(@user)
    end

    xit "should not login user if password is incorrect" do
      valid_user = User.authenticate_with_credentials("d@l.com", "123456")
      expect(valid_user).to_not eq(@user)
    end

    xit "should login user if letters are capitalized" do
      valid_user = User.authenticate_with_credentials("D@L.com", "12345")
      expect(valid_user).to eq(@user)
    end

    xit "should login user there is whitspace in the email" do
      valid_user = User.authenticate_with_credentials("    d@l.com    ", "12345")
      expect(valid_user).to eq(@user)
    end    

  end

end
