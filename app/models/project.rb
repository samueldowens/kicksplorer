require 'open-uri'
class Project < ActiveRecord::Base

  def self.project_url
    "https://www.kickstarter.com/projects/search.json?page=#{page_num}&term=#{letter}"
  end

  def self.scrape
    letter = "a"
    page_num = 1
    while letter != "aa"
      while page_num < 31
        url = URI.parse("https://www.kickstarter.com/projects/search.json?page=#{page_num}&term=#{letter}")
        result = JSON.parse(open(url).read)
        result.first[1].size.times do |x|
          project = result.first[1][(x)]
          if project["pledged"] >= (project["goal"] * 0.2) && (Time.at(project["deadline"]) > Time.now || !Project.where(ks_id: project["id"]).empty?) 
            proj = Project.find_or_create_by(ks_id: project["id"])
            proj.update(
              ks_id: project["id"],
              name: project["name"], 
              blurb: project["blurb"], 
              goal: project["goal"], 
              pledged: project["pledged"], 
              state: project["state"], 
              country: project["country"], 
              currency: project["currency"], 
              currency_symbol: project["currency_symbol"], 
              deadline: project["deadline"], 
              # created_at: project["created_at"], 
              launched_at: project["launched_at"], 
              backers_count: project["backers_count"], 
              photo: project["photo"]["full"], 
              creator: project["creator"]["name"], 
              location: project["location"]["short_name"], 
              category: project["category"]["name"], 
              urls: project["urls"]["web"]["project"]
            )
            proj.save
            puts letter
            puts page_num
          end
        end
        page_num += 1
      end
      letter.next!
      page_num = 1
    end
    self.remove_expired
  end

  def self.remove_expired
    tbd = Project.all.select { |project| Time.at(project.deadline) < Time.now }
      if !tbd.empty? 
        tbd.each do |project|
          project.destroy
        end
      end
  end

  def self.categories
    list = []
    Project.all.each do |project|
      list << project.category
    end
    list.uniq.sort
  end

end


