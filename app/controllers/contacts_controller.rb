class ContactsController < ApplicationController
  def contact_list
    @contacts = Contact.all
    render 'contactlist.html.erb'
  end
end

