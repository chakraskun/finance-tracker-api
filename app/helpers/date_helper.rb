# frozen_string_literal: true

module DateHelper
  def readable_date date
    return "-" unless date.present?
    I18n.l(date, format: '%A, %d %B %Y')
  end

  def readable_date_2 date
    return "-" unless date.present?
    I18n.l(date, format: '%d %B %Y')
  end

  def readable_date_3 date
    return "-" unless date.present?
    I18n.l(date, format: '%d-%m-%Y')
  end

  def readable_timestamp date
    return "-" unless date.present?
    I18n.l(date.localtime, format: '%A, %d %B %Y %H:%M')
  end

  def readable_timestamp_2 date
    return "-" unless date.present?
    I18n.l(date.localtime, format: '%d %B %Y %H:%M')
  end

  def readable_hour date
    return "-" unless date.present?
    I18n.l(date.localtime, format: '%H:%M:%S')
  end

  def readable_hour_2 date
    return "-" unless date.present?
    I18n.l(date.localtime, format: '%H:%M')
  end

  def auth_salt date
    return "-" unless date.present?
    I18n.l(date, format: '%Y%m%d%H')
  end

  def html_input_date date
    return '' unless date.present?
    I18n.l(date, format: '%d/%m/%Y')
  end

  def daytext date1, date2
    res = date2 - date1
    return 'today' if res == 0
    return "#{res.to_i} days ago"
  end

  def second_diff time1, time2
    if !time1.present? || !time2.present?
      return '-'
    end
    "#{((time2 - time1) * 24.0 * 60.0 * 60.0).to_f.round(1)}s"
  end
end


