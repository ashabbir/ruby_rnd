class Result
  attr_accessor :title, :summary, :id
end


require 'clusterer'
require 'pry'
require 'mongo'
include Mongo

#connect to mongo
col = MongoClient.new.db('pipeline')['searched']

#get all searched documents
articles = col.find
results = []
articles.each do |x|
  r = Result.new
  r.title = x['headline']
  r.summary = x['summary']
  r.id = x['_id']
  results << r
end
#create cluster
total_count = articles.count
clustered_count = 0
cluster_count = 0

clusters = Clusterer::Clustering.cluster(
  :kmeans, results,
  {
    no_stem: true, tokenizer: :simple_ngram_tokenizer,
    seeds: 20
  }
) { |r| r.title.to_s[0..200] }

File.open("temp.html","w") do |f|
  f.write("<ul>")
  cluster_count = clusters.count
  clusters.each do |clus|
    f.write("<li>")
    f.write("<h4>")
#    clus.centroid.to_a.sort{|a,b| b[1] <=> a[1]}.slice(0,3).each {|w| f.write("#{w[0]} - #{format '%.2f',w[1]}, ")}
    clus.centroid.to_a.sort{|a,b| b[1] <=> a[1]}.slice(0,3).each {|w| f.write("#{w[0]} - ") }

    f.write("</h4>")
    f.write("<ul>")
    clus.documents.each do |doc|
      clustered_count +=1
      result = doc.object
      f.write("<li>")
      f.write("<span class='title'>")
      f.write("#{result.id} - #{result.title}")
      f.write("</span>")
      f.write("</li>")
    end
    f.write("</ul>")
  end
  f.write("</ul>")
  f.write("</li>")
end


puts "total: #{total_count}"
puts "clustered: #{clustered_count}"
puts "clusters: #{cluster_count}"
