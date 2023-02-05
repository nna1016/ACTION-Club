class HomeController < ApplicationController
  def index
    @myRequests = Request.where(user_id: current_user.id).order(updated_at: :desc).limit(5)
    if current_user.role_id.slice(0) == "4"
      @Requests = Request.order(updated_at: :desc).limit(5)
    elsif current_user.role_id.slice(2) == "6"
        @Requests = Request.where("kind LIKE ?", "%hr%").order(updated_at: :desc).limit(5)
    elsif current_user.role_id.slice(3) >= "3" || current_user.role_id.slice(4) == "1"
        @Requests = Request.where("kind LIKE ?", "%cf%").or(Request.where("kind LIKE ?", "%gd%")).order(updated_at: :desc).limit(5)
    elsif current_user.role_id.slice(4) == "1"
        @Requests = Request.where("kind LIKE ?", "%gd%").order(updated_at: :desc).limit(5)
    end
    @Activities = Attendance.where(out: nil, date: Date.current.strftime("%Y-%m-%d"))
  end
  def recruit
    
  end
  def logs
    if current_user.role_id.slice(0) == "4"
      else
        flash[:alert] = "権限がありません"
        redirect_to root_path
      end
  end
  def resourceMonitor
    if current_user.role_id.slice(0) == "4"
      else
        flash[:alert] = "権限がありません"
        redirect_to root_path
      end
  end
  def commingsoon
    flash[:alert] = "【 404 Page Not Found 】ページが存在しません。管理者へお問合せください。"
    redirect_to root_path
  end
end
