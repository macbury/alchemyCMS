ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => '/sesja', :action => 'przekieruj'
  
  map.zaloguj 'zaloguj', :controller => 'sesja', :action => 'zaloguj'

  map.namespace :admin do |admin|
    admin.resources :uzytkownicy, :collection => { :wyloguj => :get }
    admin.resources :strony
    admin.resources :galerie
    admin.resources :wydarzenia, :collection => { :moje => :get }
    admin.komentarze '/admin/komentarze', :controller => 'komentarze'
    admin.resources :linki, :collection => { :order => :post }
    admin.konfiguracja 'opcje', :controller => 'strony', :action => 'opcje'
    admin.profil 'profil', :controller => 'uzytkownicy', :action => 'profil'
  end
  
  map.galerie 'galeria', :controller => 'galeria'
  map.galeria 'galeria/:id', :controller => 'galeria', :action => 'show'
  
  map.wydarzenia 'wydarzenia/:page', :controller => 'wydarzenia', 
        :action => 'index',
        :page => 1,
        :requirements => { :page => /\d/ }
  
  map.wydarzenia_rss 'wydarzenia/rss', 
        :controller => 'wydarzenia', 
        :action => 'index',
        :format => 'rss'
  
  map.wydarzenia_archiwum 'archiwum/:rok', :controller => 'wydarzenia', 
        :action => 'archiwum',
        :rok => Time.new.year,
        :requirements => { :rok => /\d{4}/ }
  
  map.connect 'wydarzenia/:rok/:miesiac/:id/:page', :controller => 'wydarzenia', 
        :action => 'show',
        :page => 1,
        :requirements => { :rok => /\d{4}/, :miesiac => /\d{2}/ }
  
  
  map.strona '/:id', :controller => 'strony', :action => 'index'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
