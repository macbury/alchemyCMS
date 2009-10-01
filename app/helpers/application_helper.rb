# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def error_for(object,attr,srednik = true)
    blad = object.errors.on(attr)
    return if blad.nil?
    wynik = String.new
    wynik += " - " if srednik
    blad.each do |tresc|
      wynik += content_tag :span, tresc, :style => 'color:red'
    end
    return wynik
  end
end
