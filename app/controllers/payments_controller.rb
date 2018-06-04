class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.price*100, # amount in cents, again
        currency: "GBP",
        source: token,
        description: params[:stripeEmail],
        receipt_email: params[:stripeEmail]
      )

      if charge.paid

        order = Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )

        UserMailer.payment_received(@user, order).deliver_now
      end
      redirect_to '/payments/success', notice: "Your payment was processed successfully. Thank you for purchasing."

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]} Please contact your bank"
      redirect_to product_path(@product)
    end
  end
end
