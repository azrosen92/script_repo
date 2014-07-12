class ScriptsController < ApplicationController
  # TODO: add functionality for downloading scripts on /show page
  before_action :set_script, only: [:show, :edit, :update, :destroy]

  # GET /scripts
  def index
    @scripts = Script.all
  end

  # GET /scripts/1
  def show
  end

  # GET /scripts/new
  def new
    @script = Script.new
  end

  # GET /scripts/1/edit
  def edit
  end

  # GET /scripts/1/download
  def download(id)
    dl_file = Script.find(id)
    send_file dl_file.file_path, x_sendfile: true
  end

  # POST /scripts
  def create

    # TODO: make a unique id field for files, so duplicate file names don't cause bugs
    # TODO: check to make sure file is a bash script
    # TODO: [future] check to make sure file is not malicious

    # get file from request
    uploaded_io = params[:script][:script_file]

    # get attributes from file for inputting into database
    name = uploaded_io.original_filename
    file_path = Rails.root.join(ENV['FILE_STORAGE_ROOT'], name)
    downloads = 0
    size = uploaded_io.size
    
    puts "FILE SIZE IS %d", size

    # create file object for putting into db
    @script = Script.new(name: name, 
                         file_path: file_path.to_s,
                         downloads: downloads,
                         size: size)

    # upload file to disk
    File.open(file_path, "wb") do |file|
      file.write(uploaded_io.read)
    end

    # save file info to database
    if @script.save
      redirect_to @script, notice: 'Script was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /scripts/1
  def update
    # TODO: make a functionality for increasing download count
    # TODO: [feature] upvote/downvote feature?
    if @script.update(script_params)
      redirect_to @script, notice: 'Script was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /scripts/1
  def destroy
    @script.destroy
    redirect_to scripts_url, notice: 'Script was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def script_params
      params.require(:script).permit(:name, :file_path, :size, :downloads)
    end
end
