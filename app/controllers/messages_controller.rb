class MessagesController < ApplicationController
  before_action :set_group, only: [:create]

  def create
    @message = Message.new(message_params)
    return redirect_to @group, alert: 'messageを入力してください' unless @message.save
    respond_to do |format|
      format.html { redirect_to @group }
      format.json { render json: @message }
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :avatar).merge(
      group_id: params[:group_id],
      user_id: current_user.id
    )
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
1
