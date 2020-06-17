ActionMailer::Base.smtp_settings = { 
 :address              => "smtp.gmail.com", 
 :port                 => 587, 
 :domain               => "gmail.com", 
 :user_name            => "cs290finalkp", 
 :password             => Rails.application.secrets.smtp_password, 
 :authentication       => "plain", 
 :enable_starttls_auto => true
}
