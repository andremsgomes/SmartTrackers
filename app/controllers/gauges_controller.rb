class GaugesController < ApplicationController
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
    @gauge = Gauge.new
  end

  # POST /gauges or /gauges.json
  def create
    @gauge = Gauge.new(gauge_params)

    respond_to do |format|
      if @gauge.save
        format.html { redirect_to gauge_url(@gauge), notice: "Gauge was successfully created." }
        format.json { render :show, status: :created, location: @gauge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gauge.errors, status: :unprocessable_entity }
      end
    end
  end
end
