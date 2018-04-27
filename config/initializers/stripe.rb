if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_rXMyHnNm0FIE8yAY3IqTnECN',
    secret_key: 'sk_test_l1LK6a0ifDRy82ZgUVW71OBJ'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
