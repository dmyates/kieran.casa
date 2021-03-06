# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :livereload

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  # Font Awesome URL helpers
  def twitter_link(profile: nil, tweet: nil)
    if profile
      "<i class='fa fa-twitter'></i>&nbsp;<a href='https://twitter.com/#{profile}'>@#{profile}</a>"
    end
  end

  def github_link(project: nil)
    profile = project[:profile]
    repo = project[:repo]
    "<i class='fa fa-github'></i>&nbsp;<a href='https://github.com/#{profile}/#{repo}'>#{repo}</a>"
  end

  def website_link(url:, text:)
    "<i class='fa fa-globe'></i>&nbsp;<a href='#{url}'>#{text}</a>"
  end

  def reddit_link(subreddit: nil)
    "<i class='fa fa-reddit'></i>&nbsp;<a href='https://reddit.com/r/#{subreddit}/'>/r/#{subreddit}</a>"
  end

  # Sheilds

  def twitter_shield(profile:)
    image_tag "https://img.shields.io/twitter/follow/#{profile}.svg?style=flat&label=Followers"
  end

  # Gravitar
  def gravitar(email:)
    hash = Digest::MD5.hexdigest(email.chomp.downcase)
    "https://www.gravatar.com/avatar/#{hash}.jpg"
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :minify_html
end
