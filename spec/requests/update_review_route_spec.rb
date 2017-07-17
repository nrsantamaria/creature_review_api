require 'rails_helper'

describe "get an individual review route", :type => :request do
  review = FactoryGirl.create(:review)

  before { get review_path(review) }

  after {  get :put, params: { :author => 'test nicky'} }


  # it 'returns a confirmed status' do
  #   expect(response).to have_http_status(200)
  # end

  it 'returns all new author' do
    expect(JSON.parse(response.body)["author"]).to eq('test nicky')
  end
end
