class TicketsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @tickets = Ticket.includes(:user).order('created_at DESC')
  end
  

  def new
    @ticket = Ticket.new
    @categories = Category.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to '/'
    else
      render 'tickets/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  def destroy
    if @ticket.destroy
      redirect_to root_path
    else
      redirect_to ticket_path(@ticket.id)
    end
  end
            
  private

  def ticket_params
    params.require(:ticket).permit(:name,:image, :introduction,:category_id).merge(user_id: current_user.id)
  end
  
  def set_item
     @ticket = Ticket.find(params[:id])
  end
  
  def update_params
      params.require(:ticket).permit(:name,:image, :introduction, :category_id)[:image_url, :id]
  end

end
