class Stores::Paypal

	attr_accessor :payment
	attr_accessor :total
	attr_accessor :items
	attr_accessor :return_url
	attr_accessor :cancel_url


	include PayPal::SDK::REST

	def initialize(total,items,options={})
		self.total = options[:total]
		self.items = options[:items]

		options.each {|clave,valor| instance_variable_set("@#{clave}",valor)}
	end

	def process_payment
		# Build Payment object
		self.payment = Payment.new({
			intent: "sale",
			payer:{
				payment_method: "paypal"
			},
			transactions: [
				{
					item_list:{
						items: self.items
					},
					amount:{
						total: (self.total / 100),
						currency: "USD"
					},
					description: "Compra de productos en tiendus."
				}
			],
			redirect_urls:{
				return_url: @return_url,
				cancel_url: @cancel_url
			}
		})
		return self.payment
	end

	#metodo que recibe un bloque
	def self.checkout(payer_id,payment_id,&block)
		payment = Payment.find(payment_id)
		if payment.execute(payer_id)
			yield if block_given?
		end
		
	end
end