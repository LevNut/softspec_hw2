require "gem_assignment/version"

module GemAssignment
  class Error < StandardError; end

  # Teeranut Sawanyawat
  # 6210545491

  require 'nokogiri'
  require 'httparty'
  require 'byebug'

  def req(url)
    doc = HTTParty.get(url) # get request
    parsed ||= Nokogiri::HTML(doc.body) # reformatted

    # name
    com_name = parsed.css('div.col-xs-12.col-md-12.col-lg-8')
    name = com_name.css('h3').text

    # Third tri-mas
    com_mon = parsed.css('ul.nav.nav-tabs.set-nav-tabs')
    mon_link = com_mon.css('a')[1].attributes['href'].value
    mon_parsed = "https://www.set.or.th#{mon_link}"
    doc2 = HTTParty.get(mon_parsed)
    parsed2 ||= Nokogiri::HTML(doc2.body)
    com_mon_parsed = parsed2.css('div.table-responsive')
    mon = com_mon_parsed.css('tr')[2].css('td')[-2].text

    # ------------------------------------------------
    # Represent data
    puts "#{name} : #{mon}"
  end

  def scrapper
    url = 'https://www.set.or.th/set/commonslookup.do'
    doc = HTTParty.get(url) # get request
    parsed ||= Nokogiri::HTML(doc.body) # reformatted

    hp = parsed.css('div.col-xs-12.padding-top-10.text-center.capital-letter')
    prefix = hp.css('a')

    prefix.each do |x|
      url2 = "https://www.set.or.th#{x.attributes['href'].value}"
      doc2 = HTTParty.get(url2) # get request
      parsed2 ||= Nokogiri::HTML(doc2.body) # reformatted

      e_com_name = parsed2.css('table.table-profile.table-hover.table-set-border-yellow')
      name = e_com_name.css('td').css('a')

      name.each do |short_name|
        url = "https://www.set.or.th#{short_name.attributes['href'].value}"
        self.req(url)
      end
    end

  end

  scrapper
end
