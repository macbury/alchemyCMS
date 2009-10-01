class Komentarz < ActiveRecord::Base
  belongs_to :dokument, :polymorphic => true
  belongs_to :uzytkownik
  
  validates_length_of :tresc, :within => 3..500
  
  before_create :czySpam?
  
  def request=(req)
    self.user_ip = req.remote_ip
    self.user_agent = req.env['HTTP_USER_AGENT']
    self.referrer = req.env['HTTP_REFERER']
  end
  
  def czySpam?
    self.akceptowany = !Akismetor.spam?(akismet_attributes)
    true
  end
  
  def autor
    uzytkownik.autor
  end
  
  def akismet_attributes
    {
      :key => KONFIG['akismet']['api'],
      :blog => KONFIG['akismet']['url'],
      :user_ip => user_ip,
      :user_agent => user_agent,
      :comment_author => autor,
      :comment_content => tresc
    }
  end
  
  def spam!
    update_attribute(:akceptowany, false)
    Akismetor.submit_spam(akismet_attributes)
  end

  def ham!
    update_attribute(:akceptowany, true)
    Akismetor.submit_ham(akismet_attributes)
  end
 
end
