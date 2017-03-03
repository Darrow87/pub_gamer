class User < ActiveRecord::Base
  has_secure_password
  validates :user_name, :email, :password, :birthday, presence: true
  validates :user_name, :email, uniqueness: true
  validates_length_of :first_name, maximum: 50, message: "50 character max"
  validates_length_of :last_name, maximum: 50, message: "50 character max"
  validates_length_of :user_name, maximum: 50, message: "50 character max"
  validates_length_of :email, maximum: 100, message: "over character limit"
  validates_length_of :bio, maximum: 500, message: "over character limit"
  # validates_inclusion_of :age, in: 18..99
  has_attached_file :photo,
  	styles: { medium: "200x200>", small: "100x100>", thumb: "60x60>" },
  	default_url: "/images/:style/octopus0.3opacity.png"
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  has_many :reviews
  has_many :user_venues
  has_many :favorites, through: :user_venues, source: :venue
  has_many :user_events
  has_many :events, through: :user_events
  has_many :user_reports

  def has_favorited?(venue)
  	self.favorites.include?(venue)
  end

  def has_favorites?
  	!self.favorites.empty?
  end

	def has_upcoming_events?
		!self.events.empty?
	end

	def has_created_events?
		!self.created_events.empty?
	end

	def created_events
		events = Event.where(user_id: self.id)
		sorted_events = events.sort_by &:date
		sorted_events.reverse
	end

	def attending_events
		self.events
	end

	def all_events
		events = self.created_events + self.attending_events
	end

	def upcoming_events
		events = self.all_events.select { |event| event.date >= Date.yesterday }
		events.sort_by &:date
	end

	def past_events
		self.all_events.select { |event| event.date < Date.today }
	end

	def update_favorites(selected_venue)
		if self.favorites.include?(selected_venue)
			self.favorites.delete(selected_venue)
		else
			self.favorites << selected_venue
		end
		self.favorites.length
	end

	def old_password
	end

	def new_password
	end

	def self.find_user(params)
		param = params[:user_name] || params[:user_id] || params[:id]
		user = User.find_by(user_name: param) || User.find_by(id: param)
		return user
	end

	def update_password(password, confirmation)
		if password == confirmation
			self.update_attribute("password", password)
			notice = ["Password successfully updated"]
		else
			notice = ["Password failed to update"]
		end
	end

	def favorite_added?(prev_num_of_favs)
		self.favorites.length > prev_num_of_favs
	end

	def favorite_removed?(prev_num_of_favs)
		!self.favorite_added?(prev_num_of_favs)
	end

	def display_bio
		self.bio.split("\r\n")
	end

  def slug
    user_name.parameterize
  end

  def to_param
  	"#{slug}"
  end

end
