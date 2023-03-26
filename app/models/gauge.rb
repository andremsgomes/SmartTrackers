class Gauge < ApplicationRecord
  enum unit: { kwh: 0 }
  enum time_unit: { days: 0, weeks: 1, months: 2, years: 3 }
end
