class PageScansController < ApplicationController
  before_action :set_page_scan, only: %i[ show edit update destroy ]

  # GET /page_scans or /page_scans.json
  def index
    if (webpage_id = params[:webpage_id])
      @webpage = Webpage.find(webpage_id)
      @page_scans = @webpage.page_scans
    else
      @page_scans = PageScan.all
    end
  end

  # GET /page_scans/1 or /page_scans/1.json
  def show
  end

  # GET /page_scans/new
  def new
    @page_scan = PageScan.new
  end

  # GET /page_scans/1/edit
  def edit
  end

  # POST /page_scans or /page_scans.json
  def create
    @page_scan = PageScan.new(page_scan_params)

    respond_to do |format|
      if @page_scan.save
        format.html { redirect_to @page_scan, notice: "PageScan was successfully created." }
        format.json { render :show, status: :created, location: @page_scan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_scans/1 or /page_scans/1.json
  def update
    respond_to do |format|
      if @page_scan.update(page_scan_params)
        format.html { redirect_to @page_scan, notice: "PageScan was successfully updated." }
        format.json { render :show, status: :ok, location: @page_scan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_scans/1 or /page_scans/1.json
  def destroy
    @page_scan.destroy
    respond_to do |format|
      format.html { redirect_to page_scans_url, notice: "PageScan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_scan
      @page_scan = PageScan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_scan_params
      params.require(:page_scan).permit(:type, :url, :webpage_id, :warnings, :errors)
    end
end
