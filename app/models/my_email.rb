# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MyEmail < ActiveRecord::Base

	validates_presence_of :email, message: "Woop! El correo esta vacio."
	validates_uniqueness_of :email, message: "Este correo ya esta registrado"
	validates_format_of :email,with: Devise::email_regexp, message: "No es un correo"
end
