class StronyController < ApplicationController
  def index
    if params[:id].nil?
      @strona = Strona.find :first
    else
      @strona = Strona.find_by_permalink(params[:id])
    end
    
    @tytul = @strona.nazwa
  end
end
