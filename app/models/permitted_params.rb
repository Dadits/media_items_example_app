class PermittedParams

  attr_reader :params

  def initialize(params)
    @params = params
  end
  
  def media_item
    params.require(:media_item).permit(:name, :media_type, :shared, link_attributes: [:url, :link_type], images_attributes: [:file, :_destroy, :id])
  end
  
end