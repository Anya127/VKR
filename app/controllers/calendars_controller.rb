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

  def index_for_user
    @year = params.has_key?(:year) ? params[:year].to_i : 2017
    @calendars = (Calendar.where(year_c: @year).order(:date_c).all)
    @hash = Hash.new{ |h, k| h[k] = [] }
    @vocations = Vocation.where("extract(year from d_conclusion_v) = :year OR extract(year from d_expiration_v ) = :year", year: @year).all
    @days = []
    @vocations.map{ |v|
      for i in v.d_conclusion_v..v.d_expiration_v
        @days << i
      end
    }
    @days.uniq!
    @calendars.each do |s|
      @hash[s.date_c.month] << s
    end

  end


  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  def index_commit
      (params[:day]).each do |key, value|
        obj= Calendar.find(key)
        if (value=="1")
          obj.is_output = true
        else
          obj.is_output = false
        end
        obj.save

      end
  end

  def index_for_user_commit
    y = User.find(params[:user_id])
    c = y.worker.contracts.first  # Выбрать текущий, а не первый контракт
    Vocation.where(contract_id: c.id).delete_all
    date_start = nil
    date_finish = nil
   i=0
    days = (params[:day])
    flag = 0

    days.each do |key, value|
      obj= Calendar.find(key)

      #  raise ((obj.date_c).class).inspect
      if (value=="1")
        if (flag==1)
         date_start = obj.date_c

        else
          flag = 1
          date_start = obj.date_c
          date_finish = obj.date_c

        end
       else
           if (flag==1)
             flag = 0
              # raise  date_finish.inspect
             x =  Vocation.create(type_v: "1" + i.to_s,
               d_conclusion_v: date_start, d_expiration_v: date_finish,
               is_real: "false", order_date: Date.today,
               order_number: "order_number " + i.to_s, contract_id: c.id)
           end
           i+=1

       end

    i+=1
    end
  end
    # @vocation_days = 28
    # (params[:day]).each do |key, value|
    #   obj= Calendar.find(key)
    #   if (value=="1")
    #
    #   else
    #
    #   end
    #   obj.save
    # end
    # end
      # ---
      # если несколько раз подрят да, записываем
      # когда встречается нет, прерываем
      # записываем кусок из да


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
      raise @calendar.inspect

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


    private
    ## Проверка прав доступа выбранной роли для данного метода
    def check_ctr_auth()
      return true
    end

end
