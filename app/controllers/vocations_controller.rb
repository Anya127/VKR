class VocationsController < ApplicationController
  before_action :set_vocation, only: [:show, :edit, :update, :destroy]

  # GET /vocations
  # GET /vocations.json
  def index
    @vocations = Vocation.all
  end

  # GET /vocations/1
  # GET /vocations/1.json
  def show
  end

  # GET /vocations/new
  def new
    @vocation = Vocation.new
  end

  # GET /vocations/1/edit
  def edit
  end

  # POST /vocations
  # POST /vocations.json
  def create
    @vocation = Vocation.new(vocation_params)

    respond_to do |format|
      if @vocation.save
        format.html { redirect_to @vocation, notice: 'Отпуск успешно создан.' }
        format.json { render :show, status: :created, location: @vocation }
      else
        format.html { render :new }
        format.json { render json: @vocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocations/1
  # PATCH/PUT /vocations/1.json
  def update
    respond_to do |format|
      if @vocation.update(vocation_params)
        format.html { redirect_to @vocation, notice: 'Отпуск успешно отредактирован.' }
        format.json { render :show, status: :ok, location: @vocation }
      else
        format.html { render :edit }
        format.json { render json: @vocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocations/1
  # DELETE /vocations/1.json
  def destroy
    @vocation.destroy
    respond_to do |format|
      format.html { redirect_to vocations_url, notice: 'Отпуск успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocation
      @vocation = Vocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocation_params
      params.require(:vocation).permit(:type_v, :d_conclusion_v, :d_expiration_v, :is_real, :order_date, :order_number, :contract_id)
    end
end
