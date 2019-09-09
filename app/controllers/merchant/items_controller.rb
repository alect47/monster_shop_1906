class Merchant::ItemsController < ApplicationController
  before_action :require_merchant

  def index
    @merchant = Merchant.find(current_user.merchant_id)
  end

  private

  def require_merchant
    render file: "/public/404" unless current_merchant_admin? || current_merchant_employee?
  end
end
