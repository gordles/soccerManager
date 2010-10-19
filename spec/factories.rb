# By using the symbol ':user', we get Factory Girl to simulate the User model
Factory.define :user do |user|
  user.login                  "striker10"
  user.jobID                  "2"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end