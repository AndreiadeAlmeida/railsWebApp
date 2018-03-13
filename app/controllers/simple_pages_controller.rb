class SimplePagesController < ApplicationController

  def index
  end

  def landing_page
    @products = Product.limit(@products)
  end

end
