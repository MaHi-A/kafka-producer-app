class ProducersController < ActionController::Base
	before_action :initialize_kafka, only: [:create]

	def create
		producer = @kafka.producer
		if params[:message].present? && params[:topic].present?
			producer.produce(params[:message], topic: params[:topic]) 
			producer.deliver_messages
		end
		producer.shutdown

		render json: { success: true }
	end

	private

	def initialize_kafka
		@kafka = Kafka.new(['kafka:9092'])
	end
end
