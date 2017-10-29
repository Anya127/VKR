class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @year = params.has_key?(:year) ? params[:year].to_i : 2017

    @calendars = (Calendar.where(year_c: @year).order(:date_c).all)
    @hash = Hash.new{ |h, k| h[k] = [] }
    @calendars.each do |s|
      @hash[s.date_c.month] << s
    end
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    dstart = Date.new(@calendar.year_c, 1, 1)
    dfinish = Date.new(@calendar.year_c + 1, 1, 1)
    while dstart < dfinish
      cld = Calendar.new
      cld.year_c = @calendar.year_c
      cld.date_c = dstart
      cld.is_output = (dstart.wday == 6 or dstart.wday == 0 ? true : false)
      cld.save
      dstart = dstart + 1.day
    end

    respond_to do |format|
      format.html { redirect_to calendars_path(year: @calendar.year_c), notice: 'Calendar was successfully created.' }
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:date_c, :is_output, :year_c)
    end
end
