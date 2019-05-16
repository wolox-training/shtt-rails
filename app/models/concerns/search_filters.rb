module Concerns
  module SearchFilters
    extend ActiveSupport::Concern

    included do
      scope :of_date, ->(date) { where('start_date_rent <= ? AND end_date_rent >= ?', date, date) }
      scope :current, -> { of_date(Time.zone.today.strftime('%Y-%m-%d')) }
    end
  end
end
