class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[ show edit update destroy ]
  before_action :format_salary, only: [ :create, :update ]

  def index
    @proponents = Proponent.page(params[:page] || 1)
  end

  def show
    @contact = Contact.new
  end

  def new
    @proponent = Proponent.new
    @address = @proponent.build_address
    @contacts = @proponent.contacts.build
  end

  def edit
    @address = @proponent.address
    @contacts = @proponent.contacts
  end

  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      flash[:notice] = t(".notice")
      redirect_to @proponent
    else
      flash.now[:alert] = t(".alert")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @proponent.update(proponent_params)
      flash.now[:notice] = t(".notice")
      redirect_to @proponent
    else
      flash[:alert] = t(".alert")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @proponent.destroy!

    flash.now[:notice] = t(".notice")
    redirect_to root_path, status: :see_other
  end

  private

  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  def proponent_params
    params
      .require(:proponent)
      .permit(
        :name,
        :cpf,
        :birth_date,
        :salary,
        address_attributes: [ :cep, :street, :number, :neighborhood, :city, :state ],
        contacts_attributes: [ :id, :_destroy, :reference, :name, :telephone ]
      )
  end

  def format_salary
    params[:proponent][:salary] = params[:proponent][:salary].gsub(".", "").gsub(",", ".").to_d
  end
end
