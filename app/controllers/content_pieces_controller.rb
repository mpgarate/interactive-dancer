class ContentPiecesController < ApplicationController
  # GET /content_pieces
  # GET /content_pieces.json
  def index
    @content_pieces = ContentPiece.all
    # make accessible in jQuery
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @content_pieces }
    end
  end

  # GET /content_pieces/1
  # GET /content_pieces/1.json
  def show
    @content_piece = ContentPiece.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content_piece }
    end
  end

  # GET /content_pieces/new
  # GET /content_pieces/new.json
  def new
    @content_piece = ContentPiece.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_piece }
    end
  end

  # GET /content_pieces/1/edit
  def edit
    @content_piece = ContentPiece.find(params[:id])
  end

  # POST /content_pieces
  # POST /content_pieces.json
  def create
    @content_piece = ContentPiece.new(params[:content_piece])

    respond_to do |format|
      if @content_piece.save
        format.html { redirect_to @content_piece, notice: 'Content piece was successfully created.' }
        format.json { render json: @content_piece, status: :created, location: @content_piece }
      else
        format.html { render action: "new" }
        format.json { render json: @content_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /content_pieces/1
  # PUT /content_pieces/1.json
  def update
    @content_piece = ContentPiece.find(params[:id])

    respond_to do |format|
      if @content_piece.update_attributes(params[:content_piece])
        format.html { redirect_to @content_piece, notice: 'Content piece was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_pieces/1
  # DELETE /content_pieces/1.json
  def destroy
    @content_piece = ContentPiece.find(params[:id])
    @content_piece.destroy

    respond_to do |format|
      format.html { redirect_to content_pieces_url }
      format.json { head :no_content }
    end
  end
end
