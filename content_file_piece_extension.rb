# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ContentFilePieceExtension < Radiant::Extension
  version "0.1"
  description "Extension/plugin for content_piece radiant extension - for uploading files"
  url "http://github.com/pivotib/radiant-file-content-piece-extension/tree/master"
  
  define_routes do |map|
   map.namespace :admin, :member => { :remove => :get } do |admin|
     admin.resources :content_file_pieces
   end
  end
  
  def activate
    @content_piece = ContentPiece.instance
    @content_piece << { :name => "File", :path_method => "admin_content_file_pieces_path" }
  end
  
  def deactivate
    # admin.tabs.remove "Content File Pieces"
  end
  
end
