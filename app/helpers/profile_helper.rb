module ProfileHelper

    def getProfileByUserID(user_id)

        res = Profile.joins(:department).select("profiles.*, departments.*").where(user_id: user_id,status: nil).first

        return res

    end

end
