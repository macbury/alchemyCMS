module DniHelper
  def dzien_tygodnia_pl(obj)
    case obj.created_at.strftime('%A').downcase
      when 'monday' then 'Poniedziałek'
      when 'tuesday' then 'Wtorek'
      when 'wednesday' then 'Środa'
      when 'thursday' then 'Czwartek'
      when 'friday' then 'Piątek'
      when 'saturday' then 'Sobota'
      when 'sunday' then 'Niedziela'
    end
  end
  
  def dzien_pl(obj)
    liczba = obj.created_at.strftime('%d')
    slowo = dzien_tygodnia_pl(obj)
    return "#{slowo} #{liczba}"
  end
  
  def miesiac_pl(m)
    case m.downcase
      when 'january' then 'Styczneń'
      when 'february' then 'Luty'
      when 'march' then 'Marzec'
      when 'april' then 'Kwiecień'
      when 'may' then 'Maj'
      when 'june' then 'Czerwiec'
      when 'july' then 'Lipiec'
      when 'august' then 'Sierpień'
      when 'september' then 'Wrzesień'
      when 'october' then 'Paździenik'
      when 'november' then 'Listopad'
      when 'december' then 'Grudzień'
      else m
    end
  end
  
  def distance_of_time_in_words_pl(from_time, include_seconds = false)
          from_time = from_time.to_time if from_time.respond_to?(:to_time)
          to_time = Time.now
          distance_in_minutes = (((to_time - from_time).abs)/60).round
          distance_in_seconds = ((to_time - from_time).abs).round

          case distance_in_minutes
            when 0..1
              return (distance_in_minutes == 0) ? 'mniej niż minutę' : '1 minutę' unless include_seconds
              case distance_in_seconds
                when 0..4   then 'mniej niż 5 sekund'
                when 5..9   then 'mniej niż 10 sekund'
                when 10..19 then 'mniej niż 20 sekund'
                when 20..39 then 'pół minuty'
                when 40..59 then 'mniej niż minutę'
                else             '1 minutę'
              end

            when 2..44           then "#{distance_in_minutes} minut"
            when 45..89          then 'około godzinę'
            when 90..1439        then "jakieś #{(distance_in_minutes.to_f / 60.0).round} godzin"
            when 1440..2879      then '1 dzień'
            when 2880..43199     then "#{(distance_in_minutes / 1440).round} dni"
            when 43200..86399    then 'około 1 miesiąca'
            when 86400..525599   then "#{(distance_in_minutes / 43200).round} months"
            when 525600..1051199 then 'około 1 roku'
            else                      "ponad #{(distance_in_minutes / 525600).round} lat"
          end
  end
end