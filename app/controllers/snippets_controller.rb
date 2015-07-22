class SnippetsController < ApplicationController

  def new
  	@snippet = Snippet.new
  end

  def create

  	@snippet = Snippet.new snippet_params
  		if @snippet.save
  			#PygmentsWorker.new.perform(@snippet.id)
  			
  			redirect_to "/" #snippet_path(@snippet)

  		else
  			render :new
  		end
  end

  def show
  	@snippet = Snippet.find_by_id params[:id]
  end

  private

   	def snippet_params
   		params.require(:snippet).permit(:code, :language, :highlighted)
   	end

end
