class ContactsController < ApplicationController
  def contact_list
    @contacts = Contact.all
    render 'contactlist.html.erb'
  end

  def add_contact
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone_number = params[:phone_number]
    render 'form_result.html.erb'
  end
end

