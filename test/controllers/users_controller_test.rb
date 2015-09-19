require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address: @user.address, avatar: @user.avatar, birthdate: @user.birthdate, crypted_password: @user.crypted_password, email: @user.email, face_type_id: @user.face_type_id, gender: @user.gender, hobby: @user.hobby, my_number: @user.my_number, name: @user.name, salt: @user.salt }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { address: @user.address, avatar: @user.avatar, birthdate: @user.birthdate, crypted_password: @user.crypted_password, email: @user.email, face_type_id: @user.face_type_id, gender: @user.gender, hobby: @user.hobby, my_number: @user.my_number, name: @user.name, salt: @user.salt }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
