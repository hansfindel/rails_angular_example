class MailsController < ApplicationController

	def create
	  respond_to do |format|
       if @mail = Mail.dispatch_mails(params)
          format.html { redirect_to root_url, notice: 'Mail was successfully delivered.' }
          format.json { head :no_content }
        else
          format.html { redirect_to root_url, notice: 'Mail was not delivered.' }
          format.json { render json: @mail.errors, status: :unprocessable_entity }
        end
      end
	end

end
