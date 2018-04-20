require 'rails_helper'

  describe Product do
    let(:product) { Product.create!(name: "race bike", description: "best bike ever", image_url:"http://d2plslj6xljffa.cloudfront.net/imgs/products/px/400_constH/FBOOPIC_P2.jpg", price:"22.5") }
    let(:user) { User.create!(first_name: "Ana", last_name:"Almeida", email: "test@gmail.com", password: "analmeida")}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

    it "is not valid without a image" do
      expect(Product.new(description: "Nice bike", name: "race bike", price: 22.5)).not_to be_valid
    end
  end
