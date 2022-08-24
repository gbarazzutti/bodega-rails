# frozen_string_literal: true
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_movement
    @product = Product.find(params[:id])
    @movement = Movement.new
  end

  def create_movement
    @product = Product.find(params[:id])
    @movement = Movement.new(movement_params)
    @movement.product_id = @product.id
    if @movement.save
      redirect_to @product, notice: 'Se creó el movimiento correctamente.'
    else
      flash[:notice] = 'Ha ocurrido un error al crear el movimiento.'
      render :new_movement, status: :unprocessable_entity
    end
  end

  private

  def movement_params
    params.require(:movement).permit(:quantity, :movement_type, :comment)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

end
