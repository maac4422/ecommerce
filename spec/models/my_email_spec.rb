require 'rails_helper'

RSpec.describe MyEmail, type: :model do
  it {should validate_presence_of(:email).with_message("Woop! El correo esta vacio.")}
  it {should validate_uniqueness_of :email}

  it "should not create with invalid email" do
  	email = MyEmail.new(email:"uriel")
  	expect(email.valid?).to be_falsy
  end

  it "should not create with invalid email" do
  	email = MyEmail.new(email:"miguel@hotmail.com")
  	expect(email.valid?).to be_truthy
  end
end
