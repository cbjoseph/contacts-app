class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :grouped_contacts
  has_many :groups, through: :grouped_contacts
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  def friendly_created_at
    created_at.strftime('%b %d, %Y')
  end 

  def full_name
    first_name + " " + middle_name + " " + last_name
  end

  def prefix
    "+81" + " " + phone_number
  end

  def self.find_all_johns
    Contact.where(first_name: "John")
    # it gives you all johns-->can do it to all
  end
end
 
