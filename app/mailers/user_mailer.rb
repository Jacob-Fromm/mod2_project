class UserMailer < ApplicationMailer

    def sign_up_email
        @user = params[:user]
        email_with_name = %("#{@user.name}" <#{@user.email}>)
        mail(to: email_with_name, subject: "Thanks for signing up with Park Planner!")
    
    end
end
