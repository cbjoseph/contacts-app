class ContactsController < ApplicationController
  def index
    if params[:search_terms]
      @contacts = Contact.where("first_name LIKE ?", "%#{params[:search_terms]}%")
    else
      @contacts = current_user.contacts
    end
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name], 
      bio: params[:bio],
      # address: params[:address],
      email: params[:email],
      phone_number: params[:phone_number],
      user_id: current_user.id
    )
    @contact.save 
    flash[:success] = "Contact successfully created!"
    redirect_to "/contacts/#{@contact.id}"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    @contact.update(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name], 
      # address: params[:address],
      bio: params[:bio],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    flash[:success] = "Contact successfully updated!"
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:warning] = "Contact successfully deleted!"
    redirect_to '/contacts'
  end

  # def find_all_johns
  #   @contacts = Contact.all
  #   render 'all_johns.html.erb'
  # end
end

