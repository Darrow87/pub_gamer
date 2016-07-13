class ReviewsController < ApplicationController

	def create
		# binding.pry
		@review = Review.new(review_params)
		@review.venue_id = params[:venue_id]
		venue = Venue.find_by(id: params[:venue_id])
		@review.user_id = current_user.id
		# binding.pry
		if @review.save && request.xhr?
			render partial: 'reviews/show', locals: { review: @review }
			# binding.pry
			@review = Review.new(review_params)
		elsif @review.save
			redirect_to venue_path(venue)
		else
			@errors = @review.errors.full_messages
			render partial: 'reviews/new'
		end
	end

	private
	def review_params
		params.require(:review).permit(:content, :vibe, :recommended, :rating, :venue_id)
	end

end
