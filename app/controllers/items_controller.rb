class ItemsController < ApplicationController
  
   def index
      @folders = current_user.folders.order("name desc")   
      @items = current_user.items
   end
      
   def new
     @item = current_user.items.build     
     if params[:folder_id] #if we want to upload a file inside another folder 
      @current_folder = current_user.folders.find(params[:folder_id]) 
      @item.folder_id = @current_folder.id 
     end    
   end
   
   def create
      @item = current_user.items.new(item_params)
      @item.user_id = current_user.id
      if @item.save
         flash[:notice] = "The file #{@item.attachment.filename} has been uploaded."
         if @item.folder #checking if we have a parent folder for this file 
            redirect_to browse_path(@item.folder)  #then we redirect to the parent folder 
         else
            redirect_to root_path
         end
      else
         render "new"
      end
   end

   def destroy
      @item = current_user.items.find(params[:id])
      @parent_folder = @item.folder #grabbing the parent folder before deleting the record 
      @item.destroy
      if @parent_folder
         redirect_to browse_path(@parent_folder) , notice:  "The file has been deleted."
      else
         redirect_to root_path
      end
   end
   def get 
    #first find the asset within own assets 
    item = current_user.items.find_by_id(params[:id]) 
     
    #if not found in own assets, check if the current_user has share access to the parent folder of the File 
    item ||= Item.find(params[:id]) if current_user.has_share_access?(Item.find_by_id(params[:id]).folder) 
     
    if item 
      #Parse the URL for special characters first before downloading 
      data = open(URI.parse(URI.encode(item.uploaded_file.url))) 
      send_data data, :filename => item.uploaded_file_file_name 
      #redirect_to asset.uploaded_file.url 
    else
      flash[:error] = "Don't be cheeky! Mind your own assets!"
      redirect_to root_url 
    end
   end
   
   private
      def item_params
        params.require(:item).permit(:name, :attachment, :user_id, :folder_id)
      end
end


