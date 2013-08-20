#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/' + DateTime.now.strftime('%B_%e')))

sortedFacts = {}

# puts doc.css('h2 + ul > li').to_a[1].class == Node::XMLElement

allLI = doc.css('h2 + ul > li').to_a

# puts allLI.size

allLI.shuffle.take(10).each { |f|
  factType = f.parent.previous.previous.child.content
  if sortedFacts[:"#{factType}"].is_a? Array
  	sortedFacts[:"#{factType}"] << f.content
  else
  	sortedFacts[:"#{factType}"] = []
  end
}

sortedFacts.keys.each { |k|
	# puts "#{sortedFacts[:"#{k}"].class} - #{k}"
	puts "#{k}\n=========="
	sortedFacts[:"#{k}"].each { |f| 
		puts "\t"+f
	}
}