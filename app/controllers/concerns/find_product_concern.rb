module FindProductConcern
  extend ActiveSupport::Concern

  included do
    before_action :find_product, only: [:add, :remove]
  end

  def find_product
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to products_path
    end
  end

end

