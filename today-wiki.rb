require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/' + DateTime.now.strftime('%B %e').gsub(' ','_')))

facts = []
fact = ''
f = nil

doc.css('h2 + ul > li').each {|e| facts << e }

# print facts.length

f = facts.sample
factType = f.parent.previous.previous.child.content
print factType + "\n\t" + f.content + "\n\n" 