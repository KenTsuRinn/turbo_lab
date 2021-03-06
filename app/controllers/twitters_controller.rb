class TwittersController < ApplicationController
  before_action :set_twitter, only: %i[show edit update destroy]

  # GET /twitters or /twitters.json
  def index
    ApplicationRecord.transaction(isolation: :read_uncommitted) do
      @current_page = params[:page].to_i || 0
      @page_size = 5
      @twitters = Twitter.order(created_at: :desc).limit(@page_size).offset(@current_page * @page_size)
      @counts = Twitter.count
    end
    @twitter = Twitter.new
  end

  # GET /twitters/1 or /twitters/1.json
  def show; end

  # GET /twitters/new
  def new
    @twitter = Twitter.new
  end

  # GET /twitters/1/edit
  def edit; end

  # POST /twitters or /twitters.json
  def create
    @twitter = Twitter.new(twitter_params)

    respond_to do |format|
      if @twitter.save
        format.turbo_stream
        format.html { redirect_to twitters_url, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @twitter }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@twitter, partial: 'twitters/form', locals: { twitter: @twitter })
        end
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitters/1 or /twitters/1.json
  def update
    respond_to do |format|
      if @twitter.update(twitter_params)
        format.html { redirect_to @twitter, notice: 'Twitter was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitters/1 or /twitters/1.json
  def destroy
    @twitter.destroy
    respond_to do |format|
      # format.turbo_stream do
      #   render turbo_stream:
      #     [
      #       turbo_stream.remove(dom_id(@twitter)),
      #       turbo_stream.append('flash', partial: 'shared/flash',
      #                                    locals: { msg_type: :notice, message: 'delete successfully!' })
      #     ]
      # end
      format.turbo_stream
      format.html { redirect_to twitters_url, notice: 'Twitter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_twitter
    @twitter = Twitter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def twitter_params
    params.require(:twitter).permit(:content, :user, :like, :dislike)
  end
end
