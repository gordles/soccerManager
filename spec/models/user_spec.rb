require 'spec_helper'

describe User do
 
 before(:each) do
  @attr = { :login => "Example login"}
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
end
