require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    student_card = doc.css('div.student-card')
    student_infos_array = []
    
    student_card.each do |card|
      student_info_hash = { 
        name: card.css('h4.student-name').text,
        location: card.css('p.student-location').text,
        profile_url: card.css('a').attribute("href").value
      }
      
      student_infos_array << student_info_hash
    end
    student_infos_array
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    
  end

end

