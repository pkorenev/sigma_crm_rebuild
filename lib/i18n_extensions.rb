module I18n
  module Backend
    module Base

    end
  end
end

I18n.module_eval do
  def self.localize_year_month(date, format = "%B %Y", locale = I18n.locale)
    return localize(date, {format: format, locale: locale}) if locale != :uk
    year = date.year
    month_name = t("date.nominative_month_names")[date.month]

    return "#{month_name} #{year}"
  end
end