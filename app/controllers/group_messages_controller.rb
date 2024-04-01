class GroupMessagesController < ApplicationController
  before_action :set_group_message, only: %i[ show edit update destroy ]

  # GET /group_messages or /group_messages.json
  def index
    @group_messages = GroupMessage.all
  end

  # GET /group_messages/1 or /group_messages/1.json
  def show
  end

  # GET /group_messages/new
  def new
    @group_message = GroupMessage.new
  end

  # GET /group_messages/1/edit
  def edit
  end

  # POST /group_messages or /group_messages.json
  def create
    @group_message = GroupMessage.new(group_message_params)

    respond_to do |format|
      if @group_message.save
        format.html { redirect_to group_message_url(@group_message), notice: "Group message was successfully created." }
        format.json { render :show, status: :created, location: @group_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_messages/1 or /group_messages/1.json
  def update
    respond_to do |format|
      if @group_message.update(group_message_params)
        format.html { redirect_to group_message_url(@group_message), notice: "Group message was successfully updated." }
        format.json { render :show, status: :ok, location: @group_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_messages/1 or /group_messages/1.json
  def destroy
    @group_message.destroy

    respond_to do |format|
      format.html { redirect_to group_messages_url, notice: "Group message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_message
      @group_message = GroupMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_message_params
      params.require(:group_message).permit(:group_id, :user_id, :content, :sent_at)
    end
end
