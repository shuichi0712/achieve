class ContactsController < ApplicationController
  def index
    @contacts
  end
  
  def new 
    if params[:back]
      @contacts = Contact.new(contacts_params)
    else
      @contacts=Contact.new
    end
  end

  def create
    @contacts=Contact.new(contacts_params)
    if @contacts.save
      redirect_to root_path, notice:"お問合せありがとうございました！"
    else
      render'new'
    end
  end
  
  def confirm
    @contacts = Contact.new(contacts_params)
    render :new if @contacts.invalid?  
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end