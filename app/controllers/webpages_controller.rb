class WebpagesController < ApplicationController
  before_action :set_webpage, only: %i[ show edit update destroy html_validation_page_scan ]

  # GET /webpages or /webpages.json
  def index
    @webpages = Webpage.all
  end

  # GET /webpages/1 or /webpages/1.json
  def show
  end

  # GET /webpages/new
  def new
    @webpage = Webpage.new
  end

  # GET /webpages/1/edit
  def edit
  end

  # POST /webpages or /webpages.json
  def create
    @webpage = Webpage.new(webpage_params)

    respond_to do |format|
      if @webpage.save
        format.html { redirect_to @webpage, success: "Webpage was successfully created." }
        format.json { render :show, status: :created, location: @webpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webpages/1 or /webpages/1.json
  def update
    respond_to do |format|
      if @webpage.update(webpage_params)
        format.html { redirect_to @webpage, success: "Webpage was successfully updated." }
        format.json { render :show, status: :ok, location: @webpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webpages/1 or /webpages/1.json
  def destroy
    @webpage.destroy
    respond_to do |format|
      format.html { redirect_to webpages_url, success: "Webpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def html_validation_page_scan
    @webpage.html_validation_page_scan
    if @webpage.save
      redirect_to @webpage
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webpage
      @webpage = Webpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webpage_params
      params.require(:webpage).permit(:name, :url, :website_id)
    end
end
