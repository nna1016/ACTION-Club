class ProfileController < ApplicationController

  def info
    @profile = Profile.joins(:department).select("profiles.*, departments.*").where(user_id: params[:id],status: nil).first
    @user = User.find_by(id: @profile.user_id)
    #@UserDept = Course.joins(:college).select("courses.id AS 'dept_id', courses.name AS 'dept_name', courses.name AS 'dept_symbol', courses.year AS 'dept_year', colleges.name AS 'c_name'").where(Course:{ dept_id: @profile.course_id})
    @userCourse = Course.find(@profile.course_id)
    @userCollege = College.find(@userCourse.college_id)
    unless @user.id == current_user.id || current_user.role_id.slice(2) >= "3" 
      flash[:alert] = "権限がありません"
      redirect_to request.referer
    end
  end

  def list
    if current_user.role_id.slice(2) >= "2"
      @profiles = Profile.joins(:user).select("profiles.*, users.role_id").where(status: nil,leaved_at: nil,).and(Profile.where.not(image: nil)).and(User.where("role_id LIKE ?", "2%")).order(user_id: :asc)
    else
      flash[:alert] = "権限がありません"
      redirect_to request.referer
    end
  end

  def entry
    if current_user.role_id.slice(2) >= "2"
    @profiles = Profile.joins(:user).select("profiles.*, users.role_id").where(status: nil,image: nil,leaved_at: nil).and(User.where("role_id LIKE ?", "2%")).order(user_id: :asc)
    else
      flash[:alert] = "権限がありません"
      redirect_to request.referer
    end
  end

  def edit
    if current_user.role_id.slice(5) < "5"
      flash[:alert] = "権限がありません"
      redirect_to request.referer
    end
    @user = Profile.where(user_id: params[:id],status: nil).order(created_at: :desc).limit(1).first
    @post = Profile.new 
  end

  def reqEdit
    @user = Profile.where(user_id: params[:id],status: nil).order(created_at: :desc).limit(1).first
    @post = Profile.new 
  end

  def imageup
    if current_user.role_id.slice(2) < "5"
      flash[:alert] = "権限がありません"
      redirect_to request.referer
    end
    @user = Profile.where(user_id: params[:id],status: nil).order(created_at: :desc).limit(1).first
    @post = Profile.new
  end

  def UserUpdate
    @item = Profile.where(user_id: params[:user_id],status: nil).order(created_at: :desc).limit(1).first
    @item.update(status: "no",updated_at: params[:updated_at])
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to "/profile/info/#{@profile.user_id}"
  end

  def reqUserUpdate
    @profile = Profile.new(profile_params)
    @profile.save
    reqNo = Profile.limit(1).order(id: :desc).first
    Request.create(user_id: current_user.id,title: "個人情報変更リクエスト",kind: "hr_UserUpdate",target: reqNo.user_id)
    @reqTarget = Request.where(user_id: current_user.id,title: "個人情報変更リクエスト",kind: "hr_UserUpdate",target: reqNo.user_id).order(id: :desc).limit(1).first
    wfRole = Profile.joins(:user).select("profiles.*, users.role_id").where(status: nil,leaved_at: nil,).and(User.where("SUBSTRING(role_id, 3, 1) = '6'")).and(User.where("role_id LIKE ?", "2%"))
    wfRole.each do |wfUser|
    view_context.slack_send_messege_email("#{wfUser.student_num.downcase}@g.neec.ac.jp",":page_with_curl:*WF作成通知* \n 内容を確認して対応してください。\n>申請No：<https://action-club.jp/request/info/#{@reqTarget.id}|#{format("%05d", @reqTarget.id)} >\n>WF名：#{@reqTarget.title} >\n>申請日時：#{@reqTarget.created_at}\n>WF作成者：<https://action-club.jp/profile/info/#{current_user.id}|#{@myprofile.username}（#{format("%06d", current_user.id)}）>")
    end
    redirect_to "/profile/info/#{@profile.user_id}"
  end

  def reqDo
    @reqTarget = Request.find(params[:id])
    @reqTarget.update(status: "success",approver: @myprofile.username)
    @updateTargetId = Profile.where(user_id: @reqTarget.target).order(id: :desc).limit(1).first
    @updateTarget = Profile.find(@updateTargetId.id)
    @oldTargetId = Profile.where(user_id: @updateTarget.user_id,status: nil).order(id: :desc).limit(1).first
    @oldTarget = Profile.find(@oldTargetId.id)
    @oldTarget.update(status: "no")
    @updateTarget.update(status: nil)
    view_context.slack_send_messege_email("#{@updateTarget.student_num.downcase}@g.neec.ac.jp",":white_check_mark:*申請が承認されました* \n 内容を確認してください。\n><https://action-club.jp/request/info/#{@reqTarget.id}|申請No：#{format("%05d", @reqTarget.id)}>\n>WF名：#{@reqTarget.title} \n>申請日時：#{@reqTarget.created_at}\n>処理日時：#{Time.now} >\n>WF処理者：#{@myprofile.username}")
    redirect_to "/profile/info/#{@updateTarget.user_id}"
  end

  def reqDeny
    @reqTarget = Request.find(params[:id])
    @reqTarget.update(status: "danger",approver: @myprofile.username)
    @updateTargetId = Profile.where(user_id: @reqTarget.target).order(id: :desc).limit(1).first
    @updateTarget = Profile.find(@updateTargetId.id)
    @updateTarget.update(status: "deny")
    view_context.slack_send_messege_email("#{@updateTarget.student_num.downcase}@g.neec.ac.jp",":negative_squared_cross_mark:*申請が否決されました* \n 内容を確認して必要であれば再申請してください。\n><https://action-club.jp/request/info/#{@reqTarget.id}|申請No：#{format("%05d", @reqTarget.id)} >\n>WF名：#{@reqTarget.title}\n>申請日時：#{@reqTarget.created_at}\n>処理日時：#{Time.now} \n>WF処理者：#{@myprofile.username}")
    redirect_to "/profile/info/#{@updateTarget.user_id}"
  end

  def assignment
    if current_user.role_id.slice(2) < "5"
      flash[:alert] = "権限がありません"
      redirect_to request.referer
    end
    @grantProfile = Profile.where(user_id: params[:id], status: nil).first
  end

  def grant
    @grantUser = Profile.find(params[:id])
    @grantUser.update(department_id: params[:dept_id])
    flash[:alert] = "付与が完了しました"
    redirect_to root_path
  end

  def new
    session[:previous_url] = request.referer  # ここで前ページセッションを保存
  end

  def create
    redirect_to session[:previous_url]  # create後に遷移させる
  end

  private
  def profile_params #ストロングパラメータ
    params.permit(:department_id,:kind,:status,:image,:updated_at,:leaved_at,:created_at,:user_id, :username, :ruby,:first_name,:last_name,:nickname,:dob,:sex,:phone,:student_num,:course_id,:teacher_name,:commute,:parent_name,:parent_phone,:parent_address)
  end
  def request_params
    params.require(:request).permit(:status, :approver)
  end
end
