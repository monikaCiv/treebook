require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  #DA BUDEMO SIGURNI DA JE LOGIRAN DA BI OBJAVIO STATUS
  test "should be logged in to post a status" do
    post :create, status: { content: "Hello" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  #MIJENJAMO AKO ŽELIMO DA KORISNIK MOŽE POSTATI SAMO AKO JE PRIJAVLJEN POD SVOJIM IMENOM
  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  #UZ POMOĆ DEVISE DOKUMENTACIJE
  test "should render the new page when logged in" do
      sign_in users(:monika)
      get :new
      assert_response :success
  end


  test "should create status when logged in" do
      sign_in users(:monika)
      
      assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status
    assert_response :success
  end

  test "should update status" do
    patch :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
