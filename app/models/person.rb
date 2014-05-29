class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :company_name, :email

  has_many :notes

  def self.merge(winner, loser)
    winner.email = loser.email if winner.email == ""
    winner.notes << loser.notes
    loser.destroy
    winner
  end

  def duplicates?(person)
    if person
      self.first_name == person.first_name &&
      self.last_name == person.last_name &&
      self.email == person.email
    end
  end
end
