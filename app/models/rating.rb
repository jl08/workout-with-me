class Rating < ActiveRecord::Base
  belongs_to :ratee, :class_name => 'User'
  belongs_to :rater, :class_name => 'User'

  validates :rank, :presence => true
  validates :ratee, :presence => true
  validates :rater, :presence => true

  def match
    # Doing it this way should avoid a database query:
    # Match.where(initiator: [ self.rater, self.ratee ], responder: [ self.rater, self.ratee ],  accepted: 1)

    if Match.find_by(initiator_id: self.rater.id, responder_id: self.ratee.id, accepted: 1)
      match = Match.find_by(initiator_id: self.rater.id, responder_id: self.ratee.id, accepted: 1)
    else
      match = Match.find_by(initiator_id: self.ratee.id, responder_id: self.rater.id, accepted: 1)
    end
  end

  def already_exists?
    # ! Rating.where(rater_id: self.rater.id, ratee_id: self.ratee.id).empty?
    Rating.where(rater_id: self.rater.id, ratee_id: self.ratee.id) != []
  end

end
