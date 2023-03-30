# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class GaugesController < ApplicationController
  before_action :authenticate_user!
  # GET /gauges or /gauges.json
  def index
    @gauges = Gauge.all
  end

  # GET /gauges/1 or /gauges/1.json
  def show
    @gauge = Gauge.find(params[:id])
  end

  # GET /gauges/new
  def new
    redirect to gauges_path if current_user.role == 'manager'
    @gauge = Gauge.new
    @units = Gauge.units.keys
  end

  # POST /gauges
  def create
    name = params[:name]
    begin_date = params[:begin]
    end_date = params[:end]
    unit = params[:unit]
    time_unit = params[:time_unit]

    @gauge = Gauge.new(name: name, begin_date: begin_date, end_date: end_date, unit: unit, time_unit: time_unit)

    respond_to do |format|
      @error = 'You must introduce a valid name.' if name.nil? || name.empty?
      @error ||= 'You must introduce a valid begin date.' if begin_date.nil? || begin_date.empty?
      @error ||= 'You must introduce a valid end date.' if end_date.nil? || end_date.empty?
      @error ||= 'You must introduce a valid measurement unit.' if unit.nil? || unit.empty?
      @error ||= 'You must introduce a valid time unit.' if time_unit.nil? || time_unit.empty?

      if @error.nil? && @gauge.save
        format.html { redirect_to gauge_entries_new_path(@gauge.id), notice: 'A new gauge was successfully created.' }
        format.json { render :show, status: :created, location: @gauge }
      else
        @error ||= 'Unexpected error.'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @error, status: :unprocessable_entity }
      end
    end
  end
end
