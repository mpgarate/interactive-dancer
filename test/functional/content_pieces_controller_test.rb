require 'test_helper'

class ContentPiecesControllerTest < ActionController::TestCase
  setup do
    @content_piece = content_pieces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_pieces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_piece" do
    assert_difference('ContentPiece.count') do
      post :create, content_piece: { format: @content_piece.format, id: @content_piece.id, url: @content_piece.url }
    end

    assert_redirected_to content_piece_path(assigns(:content_piece))
  end

  test "should show content_piece" do
    get :show, id: @content_piece
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_piece
    assert_response :success
  end

  test "should update content_piece" do
    put :update, id: @content_piece, content_piece: { format: @content_piece.format, id: @content_piece.id, url: @content_piece.url }
    assert_redirected_to content_piece_path(assigns(:content_piece))
  end

  test "should destroy content_piece" do
    assert_difference('ContentPiece.count', -1) do
      delete :destroy, id: @content_piece
    end

    assert_redirected_to content_pieces_path
  end
end
