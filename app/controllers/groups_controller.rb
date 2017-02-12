class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    return redirect_to @group, alert:'グループの作成に失敗しました！' unless @group.save
    redirect_to @group, notice: 'グループの作成に成功しました！'
  end

  def edit
  end

  def update
    @group = Group.new(group_params)
    return redirect_to @group, alert:'グループの更新に失敗しました！' unless @group.save
    redirect_to @group, notice: 'グループの更新に成功しました！'
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
