require "test_helper"

class PublicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @publication = publications(:one)
  end

  test "should get index" do
    get publications_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_publication_url
    assert_response :success
  end   

  test "should create publication" do
    sign_in users(:one)
    assert_difference("Publication.count") do
    publication publications_url, params: { publication: { description: @publication.description, image: @publication.image, title: @publication.title } }
    end
    assert_redirected_to publication_url(Publication.last)
  end

  test "should show publication" do
    get publication_url(@publication)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_publication_url(@publication)
    assert_response :success
  end

  test "should update publication" do
    sign_in users(:one)
    patch publication_url(@publication), params: { publication: { description: @publication.description, image: @publication.image, title: @publication.title }
  }
    assert_redirected_to publication_url(@publication)
  end

  test "should destroy publication" do
    sign_in users(:one)
    assert_difference("Publication.count", -1) do
    delete publication_url(@publication)
    end
    assert_redirected_to publications_url
  end
end
