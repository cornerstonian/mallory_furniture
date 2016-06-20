require 'csv'

class ProductsController < ApplicationController

  def list
    @products = fetch_products
  end

  def detail
   @products = fetch_products

    @product = @products.find {|p| p.pid == params[:id]}
  end

  def fetch_products
    products = []

    CSV.foreach("#{Rails.root}/mf_inventory.csv", headers: true) do |row|
      product_hash = row.to_hash

      if product_hash["quantity"].to_i > 0

      product = Product.new
      product.pid = product_hash['pid']
      product.item = product_hash['item']
      product.description = product_hash['description']
      product.price = product_hash['price']
      product.condition = product_hash['condition']
      product.dimension_w = product_hash['dimension_w']
      product.dimension_l = product_hash['dimension_l']
      product.dimension_h = product_hash['dimension_h']
      product.img_file = product_hash['img_file']
      product.quantity = product_hash['quantity']
      product.category = product_hash['category']

      products << product
     end
    end
    products
  end


end
