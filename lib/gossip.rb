require 'csv'

class Gossip
  attr_accessor :author, :content, :id
  @@all_gossips = []

  def initialize(id = 0, author, content)
    @id = id
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    CSV.read("./db/gossip.csv").each.with_index(1) do |csv_line, i|
      @@all_gossips << Gossip.new(i, csv_line[0], csv_line[1])
    end
    return @@all_gossips
  end

  def self.find(id)
    CSV.read("./db/gossip.csv").each.with_index(1) do |csv_line, i|
    @@all_gossips << Gossip.new(i, csv_line[0], csv_line[1])
    end
    @@all_gossips.map { |obj| return obj if obj.id == id }
  end

end