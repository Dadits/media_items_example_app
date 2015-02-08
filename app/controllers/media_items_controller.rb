class MediaItemsController < ApplicationController
  before_action :prepare_item, only: [:show, :edit, :update, :destroy]

  def index    
    @q = current_user.media_items.ransack(params[:q])
    @items = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def new
  end
  
  def create
    @item = current_user.media_items.new(permitted_params.media_item)
    if @item.save
      redirect_to media_items_path, notice: 'Media Item successfuly created'
    else
      render :new
    end
  end
  
  def show;end
  
  def edit;end
  
  def load_item_view
    @item = current_user.media_items.new(media_type: params[:type])
    @item.build_link
    @item.images.build 
  end
  
  def update
    if @item.update_attributes(permitted_params.media_item)
      redirect_to media_items_path, notice: 'Media Item successfuly updated'
    else
      render :edit
    end
  end
  
  def destroy
    @item.delete
    redirect_to media_items_path, notice: 'Media Item successfuly removed'
  end

  private
    
    def prepare_item
      @item = current_user.media_items.find(params[:id])
    end

end