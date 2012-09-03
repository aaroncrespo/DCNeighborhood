class AddressesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @addresses = Address.all
    @json = @addresses.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  def show
    @address = Address.find(params[:id])
    @json = @address.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(params[:address])
    
    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @address = Address.find(params[:id])    
    
    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.json { head :no_content }
    end
  end
end
