require 'rails_helper'

RSpec.describe 'User' do 
  let(:user) { User.new(name: 'randy', email: 'randy@mail.com', password: '123456', password_confirmation: '123456') }

  it "responds to name function" do 
    expect(user.respond_to? :name).to be_truthy 
  end

  it "responds to email function" do 
    expect(user.respond_to? :email).to be_truthy
  end

  it "email should be unique" do
    user.save
    
    user_2 = user.dup
    user_2.save
    
    expect(user_2).not_to be_valid

    user_2.email = user_2.email.upcase
    user_2.save

    expect(user_2).not_to be_valid
  end

  describe "presence validations" do 
    it "name should be present" do 
      user.name = nil

      expect(user).not_to be_valid

      user.name = ""

      expect(user).not_to be_valid

      user.name = " "

      expect(user).not_to be_valid
    end

    it "email should be present" do 
      user.email = nil

      expect(user).not_to be_valid

      user.email = ""

      expect(user).not_to be_valid

      user.name = " "

      expect(user).not_to be_valid
    end
  end

  describe "length validations" do 
    it "name should be within 50 characters" do 
      user.name = 'a' * 51

      expect(user).not_to be_valid
    end
  end


  describe "format validations" do 
    it "email should be a valid format" do 
      emails = %w[user@foo,com user at foo.org example.user@foo.foo@bar baz.com foo@bar+baz.com]
      emails.each do |address|
        user.email = address

        expect(user).not_to be_valid
      end

      emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emails.each do |address|
        user.email = address

        expect(user).to be_valid
      end

    end
  end

  describe "password and password_confirmation tests" do 
    it "will fail when blank" do 
      user.password = ''
      user.password_confirmation = ''

      expect(user).not_to be_valid
    end

    it "will fail when length is less than 6" do 
      user.password = '1' * 5
      user.password_confirmation = user.password

      expect(user).not_to be_valid
    end

    it "should be both equal" do 
      user.password = 'a' * 6
      user.password_confirmation = 'd' * 6

      expect(user).to be_valid

      # user.password = 'a' * 6
      # user.password_confirmation = 'a' * 6

      # expect(user).to be_valid
    end
  end

















end