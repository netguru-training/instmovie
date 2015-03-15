class TagsController < ApplicationController
  respond_to :html, :json
  
  def ajax_get_list
    @tags = Tag.where("name ilike ?", "%#{params[:q]}%").order(name: :asc)
    
    respond_to do |format|
      format.json { render json: @tags }
    end
  end
end
