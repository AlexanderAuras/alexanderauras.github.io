source "https://rubygems.org"

gem "jekyll", "~> 4.4.1"
gem "github-pages", group: :jekyll_plugins
group :jekyll_plugins do
#  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag", "~> 2.6"
  gem "jekyll-sitemap", "~> 1.4"
  gem "logger", "~> 1.6"
end

platforms :windows, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1", :platforms => [:windows]
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
