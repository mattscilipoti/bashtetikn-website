class WebsitesController < ApplicationController
  before_action :set_website, only: %i[destroy edit html_validation_page_scan show update]

  # GET /website/:id/html_validation_page_scan
  def html_validation_page_scan
    @website.html_validation_page_scan

    flash[:notice] = 'Scanning all pages. Wait a bit, then refresh to see scan results'
    redirect_to @website
  end

  # GET /websites or /websites.json
  def index
    @websites = Website.all
  end

  # GET /websites/1 or /websites/1.json
  def show
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites or /websites.json
  def create
    @website = Website.new(website_params)

    respond_to do |format|
      if @website.save
        format.html { redirect_to @website, notice: "Website was successfully created." }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1 or /websites/1.json
  def update
    respond_to do |format|
      if @website.update(website_params)
        format.html { redirect_to @website, notice: "Website was successfully updated." }
        format.json { render :show, status: :ok, location: @website }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1 or /websites/1.json
  def destroy
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url, notice: "Website was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = Website.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def website_params
      params.require(:website).permit(:name, :url)
    end
end
