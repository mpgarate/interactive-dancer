class CreationsController < ApplicationController
  # GET /creations
  # GET /creations.json
  respond_to :json
  def index
    @creations = Creation.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @creations }
    end
  end

  # GET /creations/1
  # GET /creations/1.json
  def show
    @creation = Creation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @creation }
    end
  end

  # GET /creations/new
  # GET /creations/new.json
  def new
    @creation = Creation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @creation }
    end
  end

  # GET /creations/1/edit
  def edit
    @creation = Creation.find(params[:id])
  end

  # POST /creations
  # POST /creations.json
  def create
    @creation = Creation.new(params[:creation])

    respond_to do |format|
      if @creation.save
        format.html { redirect_to @creation, notice: 'Creation was successfully created.' }
        format.json { render json: @creation, status: :created, location: @creation }
      else
        format.html { render action: "new" }
        format.json { render json: @creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /creations/1
  # PUT /creations/1.json
  def update
    @creation = Creation.find(params[:id])

    respond_to do |format|
      if @creation.update_attributes(params[:creation])
        format.html { redirect_to @creation, notice: 'Creation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creations/1
  # DELETE /creations/1.json
  def destroy
    @creation = Creation.find(params[:id])
    @creation.destroy

    respond_to do |format|
      format.html { redirect_to creations_url }
      format.json { head :no_content }
    end
  end
end
