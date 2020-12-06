class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(name: params[:contact][:name], email: params[:contact][:email], content: params[:contact][:content])
    if @contact.save
      redirect_to new_contact_path, notice: "お問い合わせ有難う御座います！"
    else
      render :new
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:name, :title, :content)
  end
end
