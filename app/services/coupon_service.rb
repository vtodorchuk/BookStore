class CouponService
  def self.find_coupon(params, order, coupon)
    error_message = I18n.t('order.coupon.error')

    if coupon.nil?
      error_message = ' ' if params[:code].eql?('')

      {
        error: error_message,
        total_price: order.decorate.order_price.to_s
      }
    else
      {
        total_price: order.decorate.order_price(coupon.discount).to_s,
        discount: (order.decorate.order_price * coupon.discount).to_s
      }
    end
  end
end