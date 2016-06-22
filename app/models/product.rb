class Product
    attr_accessor :pid, :item, :description, :price, :condition, :dimension_w, :dimension_l, :dimension_h, :img_file, :quantity, :category

      def discount_price
         if @product.condition == "good"
          (@product.price.to_i * 0.9)
         elsif @product.condition == "average"
          @product.price.to_i * 0.8
         else
           @product.price
      end

end
