class ContactMailer < ApplicationMailer
	def send_when_admin_reply(user) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    mail to: user.email, subject: '【サイト名】 お問い合わせありがとうございます'
  end
end
