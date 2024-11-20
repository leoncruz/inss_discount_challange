class ContactsController < ApplicationController
  before_action :set_proponent, only: [ :create ]
  before_action :set_contact, only: [ :edit, :update, :destroy ]

  def create
    @contact = @proponent.contacts.build(contact_params)

    if @contact.save
      redirect_to @proponent
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact.proponent
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy!

    redirect_to @contact.proponent, status: :see_other
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:proponent_id])
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :telephone, :reference)
  end
end
