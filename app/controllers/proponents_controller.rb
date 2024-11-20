class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[ show edit update destroy ]

  def index
    @proponents = Proponent.all
  end

  def show
  end

  def new
    @proponent = Proponent.new
  end

  def edit
  end

  def create
    @proponent = Proponent.new(proponent_params)

    if @proponent.save
      flash[:notice] = t(".notice")
      redirect_to @proponent
    else
      flash.now[:alert] = t(".alert")
      render :new, status: :unprocessable_entity, alert: ""
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
    params.require(:proponent).permit(:name, :cpf, :birth_date, :salary)
  end
end
