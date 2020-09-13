class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def index
    @users=User.all
  end

  def show
   @currentUserEntry=Entry.where(user_id: current_user.id)
    #current_user情報をEntriesテーブルに送る。
    @userEntry=Entry.where(user_id: current_user.id)
    #DMを送る対象のユーザーをEntriesテーブルから探す
    unless current_user.id == @user.id
    #DMを送る対象は自分にはできないこととする。
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            #すでにチケットとuser間でroomがあった際
            @roomId = cu.room_id
            #そのルームIDを取り出す
          end
        end
      end
    end

      unless @isRoom
      #すでにチケットとuser間でroomがなかった際
        @room = Room.new
        @entry = Entry.new
      #roomとentryを新規に作成する
       end
  end


  def edit
  end 

  def update
    current_user.update(user_params)
    redirect_to root_path
  end
   
  def destroy
   @user = User.find(params[:id]) 
   @user.destroy
   flash[:success] = '退会が完了しました'
   redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :family_name, :last_name, :family_name_kana, :last_name_kana, :birthday, :student_division_id,)
  end
end
