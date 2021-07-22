class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

# 確認画面表示
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

# 戻ったときに入力内容を反映
  def back
    @contact = Contact.new(contact_params)
    render :new
  end


  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :message
                 )
  end

end
