require 'mechanize'

class Google
  SEARCH_BASE_URI = 'https://www.google.com/search'.freeze

  def initialize(query)
    @result = agent.get(SEARCH_BASE_URI, q: query)
  end

  def click_first_link
    link = @result.at('#search ol li a')
    agent.click(link)
  end

  private

  def agent
    @agent ||= Mechanize.new
  end
end

Google.new('which university').click_first_link
puts 'Clicked'
