class PagesController < ApplicationController
  @@date_today = Date.parse('2020-08-03')
  @@news_today = Hash.new
  
  def index
    @news = todays_news
    @listings = Listing.includes(:category, :account).all.with_attached_pictures.order("created_at DESC").limit(8)
  end

  def errors
  end

  private
    # Grabs news from the given date
    def grab_news(date)
      fortnight_ago = date - 14
      #API KEY - NEED TO STORE
      api_key = Rails.application.credentials.dig(:"news-api-key")
      response = News.new(api_key)
      news = response.get_everything(q:'aircraft', from:"#{fortnight_ago}", sortBy: "popularity")
    end

    # Grabs today's news. Initially checks if the today's date need to be changed, if so
    # a new get request is to be issued to grab fresh news otherwise, would use stored news
    # to minimize number of request.
    def todays_news
      if change_date?
        @@date_today = Date.today
        return @@news_today = grab_news(@@date_today)
      else
        return @@news_today
      end
    end

    # Checks if @@date_today needs to be changed to today's date
    def change_date?
      @@date_today != Date.today
    end
end
