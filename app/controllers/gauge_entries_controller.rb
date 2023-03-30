# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

class GaugeEntriesController < ApplicationController
  before_action :authenticate_user!
  # GET gauges/id/gauge_entries/new
  def new
    redirect to gauges_path if current_user.role == 'manager'
    @gauge = Gauge.find(params[:id])
    @gauge_entry = GaugeEntry.new
  end

  # POST /gauge_entries
  def create
    value = params[:value]
    gauge_id = params[:gauge_id]

    @gauge_entry = GaugeEntry.new(gauge_id: gauge_id, value: value)
    @gauge = Gauge.find(gauge_id)

    respond_to do |format|
      @error = 'You must introduce a valid value.' if value.nil? || value.empty?

      if @error.nil? && @gauge_entry.save
        format.html { redirect_to gauge_url(@gauge_entry.gauge), notice: 'Gauge entry was successfully created.' }
        format.json { render :show, status: :created, location: @gauge_entry.gauge }
      else
        @error ||= 'Unexpected error.'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @error, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gauge_entries/approve
  def approve
    id = params[:id]

    gauge_entry = GaugeEntry.find(id)
    gauge_entry.approved = true

    respond_to do |format|
      if gauge_entry.save
        format.html { redirect_to gauges_show_path(gauge_entry.gauge.id), notice: 'Gauge entry was successfully approved.' }
        format.json { render :show, status: :created, location: gauge_entry.gauge }
      else
        @error = 'Unexpected error.'
        format.html { redirect_to gauge_url(gauge_entry.gauge), status: :unprocessable_entity }
        format.json { render json: @error, status: :unprocessable_entity }
      end
    end
  end
end
