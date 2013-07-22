require 'active_model'
require 'active_model/validations'
require 'mail'

class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    # takes from https://github.com/hallelujah/valid_email/blob/master/lib/valid_email/email_validator.rb
    begin
      m = Mail::Address.new(value)
      # We must check that value contains a domain and that value is an email address
      r = m.domain && m.address == value
      t = m.__send__(:tree)
      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e
      r = false
    end
    record.errors.add attribute, (options[:message] || I18n.t(:invalid, :scope => 'cerberus.validations.email')) unless r
  end

end