require 'spec_helper'

describe User do
 
 before(:each) do
  @attr = { :login => "Example login",
            :password => "foobar",
            :password_confirmation => "foobar"
  }
 end
 
 it "should create a new instance given valid attributes" do
   User.create!(@attr)
 end
 
 it "should require a login" do
  no_login_user = User.new(@attr.merge(:login => ""))
  no_login_user.should_not be_valid
 end
 
 it "should reject duplicate and upcased login" do
   #put a user with given login into the database
   upcased_login = @attr[:login].upcase
   User.create!(@attr.merge(:login => upcased_login))
   User.create!(@attr)
   user_with_duplicate_login = User.new(@attr)
   user_with_duplicate_login.should_not be_valid
 end
 
 #it "should reject login identical up to case" do
  # upcased_login = @attr[:email].upcase
  # User.create!(@attr.merge(:email => upcased_login))
  # user_with_duplicate_email = User.new(@attr)
  # user_with_duplicate_email.should_not be valid
 #end
 
 describe "password validations" do
   
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation  => "invalid")).should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
      short = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
 end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
  
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end
      
      it "should return nil an email address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end
      
      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user 
      end      
    end
  end
end
