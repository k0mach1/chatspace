class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    return redirect_to @group, alert: '' unless @message.save
    redirect_to @group
  end

  private

  def message_params
    params.permit(:message).permit(:body).merge(group_id: @group.id, user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
