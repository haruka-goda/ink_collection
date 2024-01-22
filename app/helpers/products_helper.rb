module ProductsHelper
  def product_path_helper(product)
    product.is_a?(Pen) ? pen_path(product) : ink_path(product)
  end
end