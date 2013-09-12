class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:index, :create]
  before_action :require_login
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :last_messages, only: :index
  after_action :set_time

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where("").load
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = current_user.messages.new(message_params)

    respond_to do |format|
      if @message.save
        @messages = last_messages
        format.js
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end

    def last_messages
      @lastest = Message.where("created_at >= ?", session[:last_time]).load
    end

    def set_time
      session[:last_time] = Time.now.utc
    end
end
