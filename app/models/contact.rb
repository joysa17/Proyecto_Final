class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :surname,   :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     :validate => true

  attribute :message,	:validate => true
  

  def headers
    {
      :subject => "Consultas de compras",
      :to => "joselin.solis.3b@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end