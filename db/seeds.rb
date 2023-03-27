# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Gauge 1
Gauge.create(name: 'Gauge 1', begin_date: DateTime.new(2022, 1, 1), end_date: DateTime.new(2023, 1, 1), unit: :kwh,
             time_unit: :days)

# Gauge 2
Gauge.create(name: 'Gauge 2', begin_date: DateTime.new(2022, 6, 1), end_date: DateTime.new(2025, 6, 1), unit: :kwh,
             time_unit: :months)
