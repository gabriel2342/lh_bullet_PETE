class ServiceProvider < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :municipality
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :municipality
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.
  before_validation :reject_blank_services

  validates :name, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
  private 
    def reject_blank_services
      self.services = self.services.reject(&:blank?)
    end

end
