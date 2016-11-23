source 'https://rubygems.org'
ruby '2.2.3'

# Standard Rails gems
gem 'rails', '4.2.1'
gem 'sass-rails', '5.0.3'
gem 'uglifier', '2.7.1'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks', '2.5.3'
gem 'bcrypt', '3.1.10'

# Necessary for Windows OS (won't install on *nix systems)
gem 'tzinfo-data', platforms: [:mingw, :mswin]

# Bootstrap 3: https://github.com/twbs/bootstrap-sass
gem 'bootstrap-sass', '3.3.4.1'

# Facebook Graph API Ruby library
gem 'koala', '~> 2.2'

# PostgreSQL
gem 'pg'

# For Heroku assets generation
gem 'rails_12factor', group: :production

gem 'xystra', github: 'wazery/xystra'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '4.0.5'
  gem 'web-console', '2.1.2'

  # Code static analyzer
  gem 'rubocop'

  # Figaro: https://github.com/laserlemon/figaro
  gem 'figaro', '1.1.0'

  # Spring: https://github.com/rails/spring
  gem 'spring', '1.3.4'

  # Annotate_Models: https://github.com/ctran/annotate_models
  gem 'annotate', '2.6.8'
end

group :development, :test do
  gem 'sqlite3', '1.3.10'
end
