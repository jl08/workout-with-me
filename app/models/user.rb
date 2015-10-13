class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://prepgenie.ie/gamsat/wp-content/uploads/2015/08/default-avatar_man.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  has_many :user_activities
	has_many :activities, through: :user_activities
	has_many :ratee_ratings, :class_name => 'Rating', :foreign_key => 'ratee_id'
	has_many :rater_ratings, :class_name => 'Rating', :foreign_key => 'rater_id'

	has_many :initiator_matches, :class_name => 'Match', :foreign_key => "initiator_id"
	has_many :responder_matches, :class_name => 'Match', :foreign_key => "responder_id"

  has_many :sender_messages, :class_name => 'Message', :foreign_key => "sender_id"
  has_many :receiver_messages, :class_name => 'Message', :foreign_key => "receiver_id"

  has_many :locations

	validates :name, :gender, :presence => true
  validates :age, numericality: { only_integer: true }
  validates :email, uniqueness: true, :email_format => {:message => 'Invalid email address' }
  validates :description, length: { maximum: 200 }, allow_blank: true


	has_secure_password

  def average_rating
    # This code can be more concise:
    #
    # all_ratings = ratee_ratings.map(&:rank)
    # return nil if all_ratings.empty?
    # (all_ratings.sum / all_ratings.length).to_f
    # ==
    all_ratings = Rating.where(ratee_id: self.id).map do |rating|
      rating.rank
    end
    if all_ratings == []
      # Dont return user-facing info from your models.  I would return a nil in
      # this case probably
      return "This user has no ratings yet"
    else
      sum_of_ratings = all_ratings.inject { |sum, rating| sum + rating }
      average = sum_of_ratings.to_f/(all_ratings.length).to_f
    end
  end

end
