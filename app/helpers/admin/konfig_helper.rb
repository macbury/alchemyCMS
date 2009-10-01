module Admin::KonfigHelper
  def konfig_text(klucz,wartosc)
    text_field klucz, wartosc, :value => KONFIG[klucz][wartosc], :style => "width: 507px;"
  end
  
  def konfig_password(klucz,wartosc)
    password_field klucz, wartosc, :value => KONFIG[klucz][wartosc], :style => "width: 507px;"
  end
  
  def konfig_area(klucz,wartosc)
    text_area klucz, wartosc, :style => "width: 507px; height: 100px", :value => KONFIG[klucz][wartosc]
  end
end