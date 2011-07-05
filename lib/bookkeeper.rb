require 'mechanize'

class Bookkeeper
  attr_accessor :agent, :page, :form, :logged_in_page
  
  SIGNIN_URL='https://catalog.nypl.org/patroninfo/0/top'
  SEARCH_URL='https://catalog.nypl.org/search'

  def initialize(account_number, pin) 
    @account_number = account_number
    @pin = pin
    @agent = Mechanize.new
    @agent.follow_meta_refresh = true

    #@page = @agent.get SIGNIN_URL
    #@form = @page.forms[0]
    #@form.code = @account_number
    #@form.pin  = @pin
    #@logged_in_page = @form.submit
  end
  
  def search(title, author=nil)
    search_page = @agent.get SEARCH_URL 
    form = search_page.form 'search'
    form.searchtype = 't' # title
    form.searcharg  = title
    form.searchscope = '97' # circulating
    page = form.submit
    results = page.search("//td[@class='browseEntryData']")
    puts results.inspect
    results.collect do |result|
      link = result.search('a')[1]
      title = link.content
      url   = link.attributes['href'].value
      if result.inner_html =~ /\/ (?:by )?(.*?)\./
        author = $1
      end
      [title, author, url]
    end
  end
end
