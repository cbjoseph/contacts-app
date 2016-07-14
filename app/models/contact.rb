class Contact < ActiveRecord::Base
  def friendly_created_at
    created_at.strftime('%b %d, %Y')
    # strftime
  end 

  def full_name
    first_name + ' ' + last_name
  end

  def prefix
    "+81" + " " + phone_number
  end

  # def all_contacts
  #   find_all(first_name: "John")
  # end
end
 
