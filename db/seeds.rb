# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Gauge 1
gauge1 = Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
             time_unit: :days)
gauge1.gauge_entries.create(value: 3.3)
gauge1.gauge_entries.create(value: 4.8)
gauge1.gauge_entries.create(value: 2.9)
gauge1.gauge_entries.create(value: 5.0)
gauge1.gauge_entries.create(value: 4.3)
gauge1.gauge_entries.create(value: 3.6)

# Gauge 2
gauge2 = Gauge.create(name: 'Gauge 2', begin_date: DateTime.new(2022, 6, 1), end_date: DateTime.new(2025, 6, 1), unit: :kwh,
             time_unit: :months)
gauge2.gauge_entries.create(value: 28.3)
gauge2.gauge_entries.create(value: 34.1)
