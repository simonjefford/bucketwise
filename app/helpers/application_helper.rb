# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def visible?(flag)
    if flag
      nil
    else
      "display: none"
    end
  end

  def application_revision
    @application_revision ||= if File.exists?("#{Rails.root}/REVISION")
      File.read("#{Rails.root}/REVISION").strip
    else
      "HEAD"
    end
  end

  def application_last_deployed
    if File.exists?("#{Rails.root}/REVISION")
      @deployed_at ||= File.stat("#{Rails.root}/REVISION").ctime
      time_ago_in_words(@deployed_at) + " ago"
    else
      "(not deployed)"
    end
  end

  def format_cents(amount, options={})
    if options.delete(:hide_currency)
      options[:unit] = ''
    end
    number_to_currency(amount/100.0, options)
  end
  
  def currency_symbol
    I18n.translate('number.currency.format.unit')
  end
end
