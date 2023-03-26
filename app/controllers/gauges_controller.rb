class GaugesController < ApplicationController
  before_action :set_gauge, only: %i[ show edit update destroy ]

  # GET /gauges or /gauges.json
  def index
    @gauges = Gauge.all
  end

  # GET /gauges/1 or /gauges/1.json
  def show
  end

  # GET /gauges/new
  def new
    @gauge = Gauge.new
  end

  # GET /gauges/1/edit
  def edit
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

  # PATCH/PUT /gauges/1 or /gauges/1.json
  def update
    respond_to do |format|
      if @gauge.update(gauge_params)
        format.html { redirect_to gauge_url(@gauge), notice: "Gauge was successfully updated." }
        format.json { render :show, status: :ok, location: @gauge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gauge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gauges/1 or /gauges/1.json
  def destroy
    @gauge.destroy

    respond_to do |format|
      format.html { redirect_to gauges_url, notice: "Gauge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gauge
      @gauge = Gauge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gauge_params
      params.require(:gauge).permit(:name, :begin_date, :end_date, :unit, :time_unit)
    end
end
