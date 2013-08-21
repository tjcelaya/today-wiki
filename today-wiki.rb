#!/usr/bin/ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/' + DateTime.now.strftime('%B_%e')))

sortedFacts = {}

allLI = doc.css('h2 + ul > li').to_a.shuffle.take(10)

allLI.each { |f|
  factType = f.parent.previous.previous.child.content
  if !(sortedFacts["#{factType}"].nil?)
  	sortedFacts["#{factType}"] << f.content
  else
  	sortedFacts["#{factType}"] = []
  	sortedFacts["#{factType}"] << f.content
  end
}

sortedFacts.keys.each { |k|
	# puts "#{sortedFacts[:"#{k}"].class} - #{k}"
	puts "#{k}\n=========="
	sortedFacts["#{k}"].each { |f| 
		puts "\t"+f
	}
}
