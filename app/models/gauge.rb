class Gauge < ApplicationRecord
  enum unit: { kwh: 0 }
  enum time_unit: { days: 0, weeks: 1, months: 2, years: 3 }

  has_many :gauge_entries, dependent: :destroy

  def total_measured
    gauge_entries.sum(&:value)
  end

  def total_approved
    gauge_entries.where(approved: true).count
  end
end
