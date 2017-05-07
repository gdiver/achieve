class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]

  def index
      @contacts = root
  end
  
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      # 一覧画面へ遷移して「ブログを作成しました！」を表示
      redirect_to root_path, notice: "お問い合わせありがとうございました。"
    else
      # 入力画面を再描画
      render 'new'
    end
  end

  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end  
end
