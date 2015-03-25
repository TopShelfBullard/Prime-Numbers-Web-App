require 'rails_helper'

RSpec.describe PrimeNumbersController, :type => :controller do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    before do
      xhr :get, :show, format: :js
    end

    it "returns http success" do
      expect(response).to be_success
    end

    it "can only be accessed via javascript" do
      expect(:get => "/show").not_to be_routable
    end

    it "has a length of 1000" do
      primes = assigns(:primes)
      expect(primes.length).to eq(1000)
    end

    it "begins with 2" do
      primes = assigns(:primes)
      expect(primes.first).to eq(2)
    end

    it "ends with 7919" do
      primes = assigns(:primes)
      expect(primes.last).to eq(7919)
    end
  end
end
