class TextMessagesController < ApplicationController
  
  def index 
    @text_messages = TextMessage.all_except_event_messages
  end

  def new
    @text_message = TextMessage.new
  end

  def edit
    @text_message = TextMessage.find(params[:id])
  end

  def update
    @text_message = TextMessage.find(params[:id])
    if @text_message.update(permitted_params)
      redirect_to text_message_path(@text_message)
    else
      render 'edit'
    end
  end

  def create
    @text_message = TextMessage.create(permitted_params)
    redirect_to text_message_path(@text_message)
  end

  def show
    @text_message = TextMessage.find(params[:id])
  end

  def destroy
    @text_message = TextMessage.find(params[:id])
    @text_message.destroy
    redirect_to text_messages_path
  end

  private

  def permitted_params
    params.require(:text_message).permit(:type, :keyword, :content)
  end
end
