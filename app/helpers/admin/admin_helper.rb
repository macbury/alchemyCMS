module Admin::AdminHelper
  def ajax_remove(obj,url,co)
    link_to_remote "Usuń", 
      :url => url, 
      :confirm => "Czy chcesz usunąć #{co}?",
      :method => :delete, 
  		:complete => visual_effect(:fade, "element_#{obj.id}", :duration => 0.3)
  end
end