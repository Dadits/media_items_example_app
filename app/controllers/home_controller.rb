class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @q = MediaItem.shared.ransack(params[:q])
    @items = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end

end
