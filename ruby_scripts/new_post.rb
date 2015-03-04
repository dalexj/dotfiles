require 'date'
formatted_date = Date.today.strftime "%Y-%m-%d"
title = ARGV.join("-").downcase
capital_title = title.split("-").map(&:capitalize).join(" ")
full_path = "/Users/alex/turing/jekyll_blog/_posts/#{formatted_date}-#{title}.markdown"

md = <<MARKDOWN
---
title: #{capital_title}
date: #{formatted_date}
categories: ruby
layout: post
---
MARKDOWN

File.write(full_path, md)
%x{atom #{full_path}}
