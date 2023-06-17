class GroupController < ApplicationController
    def show
        @group = Group.find(params[:id])
        render plain: @group.inspect
    end

    def update
        @group = Group.find(params[:id])
        @group.update!(groups_params)
        render plain: @group.inspect
    end

    private
    def groups_params
        params.require(:group).permit(:name, :description)
    end
end
