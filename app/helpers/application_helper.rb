module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Sunburst Peak"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  end

  def month_select
    [
      ['January'],
      ['February'],
      ['March'],
      ['April'],
      ['May'],
      ['June'],
      ['July'],
      ['August'],
      ['September'],
      ['October'],
      ['November'],
      ['December']
    ]
  end

  def day_select
    [
      ['1'],
      ['2'],
      ['3'],
      ['4'],
      ['5'],
      ['6'],
      ['7'],
      ['8'],
      ['9'],
      ['10'],
      ['11'],
      ['12'],
      ['13'],
      ['14'],
      ['15'],
      ['16'],
      ['17'],
      ['18'],
      ['19'],
      ['20'],
      ['21'],
      ['22'],
      ['23'],
      ['24'],
      ['25'],
      ['26'],
      ['27'],
      ['28'],
      ['29'],
      ['30'],
      ['31']
    ]
  end

  def year_select
    [
      ['2018'],
      ['2019'],
      ['2020'],
      ['2021']
    ]
  end

  def hour_select
    [
      ['00'],
      ['01'],
      ['02'],
      ['03'],
      ['04'],
      ['05'],
      ['06'],
      ['07'],
      ['08'],
      ['09'],
      ['10'],
      ['11'],
      ['12'],
      ['13'],
      ['14'],
      ['15'],
      ['16'],
      ['17'],
      ['18'],
      ['19'],
      ['20'],
      ['21'],
      ['22'],
      ['23']
    ]
  end

  def minute_select
    [
      ['00'],
      ['15'],
      ['30'],
      ['45']
    ]
  end

end
