class Email

def send_mail(recipient, subject, body)
  Pony.mail(
      :to => recipient,
      :from => 'makersBNB',
      :subject => subject,
      :body => body
      )
end

end
