require 'rails_helper'

describe "get all reviews route", :type => :request do
  before { Review.destroy_all }
  let!(:reviews) { FactoryGirl.create_list(:review, 20)}

  before { get '/reviews'}

  it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
