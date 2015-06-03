###
# Blog settings
###

Time.zone = "Paris"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "/{title}.html"
  # Matcher for blog source files
  blog.sources = "blog/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "article"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "{num}"

  # blog.custom_collections = {
  #   category: {
  #     link: '/categories/{category}.html',
  #     template: '/category.html'
  #   }
  # }

end

page "/feed.xml", layout: false

# GitHub Pages wants 404.html, not 404/index.html
page '/404.html', :directory_index => false


###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###


#something for the Kramdown machine
set :markdown_engine, :kramdown
set :markdown, :tables        => true,
               :autolink      => true,
               :smartypants   => true,
               :auto_ids      => false



# multilanguage site //default french
activate :i18n, :mount_at_root => :fr

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes
# activate :automatic_alt_tags

# Reload the browser automatically whenever files change
activate :livereload

#make the urls pretty
activate :directory_indexes


activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :fonts_dir, 'fonts'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :partials_dir, 'partials'

# activate :google_drive, load_sheets: ''

# activate :google_drive, load_sheets: {
#     mysheet: '1muhcHjI1Ovk7W3Kbbrar5_86T5xEmaTCt090jWTGp6o'
# }

# activate :google_drive, load_docs: {
#     first_article: '1M6PdU-eZsbRcVhTLnLNKUskyzIYuYu8pGvcnErtiR6o'
#     # second_article: 'googledockeytwo'
# }

# <h1>My spreadsheet is called: <%= data.mysheet['marius'] %></h1>
# <% data.Sheet1.each do |row| %>
#     Column one header: <%= row['A:A'] %>
# <% end %>

# <article>
#   <%=data.first_article %>
# </article>

# activate :google_drive, load_docs: {
    # thisdoc: '1M6PdU-eZsbRcVhTLnLNKUskyzIYuYu8pGvcnErtiR6o'
    # second_article: 'googledockeytwo'
# }

# the xml sitemap sort of thing here
set :url_root, "https://#{ENV['APP_DOMAIN'] ? ENV['APP_DOMAIN'] : 'localhost:4567'}"

activate :search_engine_sitemap,
         exclude_if: -> (resource) {
           # Exclude all paths from sitemap that are sub-date indexes
           resource.path.match(/[0-9]{4}(\/[0-9]{2})*.html/)
         },
         default_change_frequency: 'weekly'

# Filewatcher ignore list (workaround for search_engine_sitemap on
# Heroku - see https://github.com/Aupajo/middleman-search_engine_sitemap/issues/2)
set :file_watcher_ignore,
    [
        /^bin(\/|$)/,
        /^\.bundle(\/|$)/,
        # /^vendor(\/|$)/,
        /^node_modules(\/|$)/,
        /^\.sass-cache(\/|$)/,
        /^\.cache(\/|$)/,
        /^\.git(\/|$)/,
        /^\.gitignore$/,
        /\.DS_Store/,
        /^\.rbenv-.*$/,
        /^Gemfile$/,
        /^Gemfile\.lock$/,
        /~$/,
        /(^|\/)\.?#/,
        /^tmp\//
    ]
# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # activate :gzip
  # Use relative URLs
  # activate :relative_assets

  # activate :minify_html

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end