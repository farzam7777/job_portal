# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

Rails.application.config.assets.precompile += %w( css/base.css )
Rails.application.config.assets.precompile += %w( css/font-awesome.css )
Rails.application.config.assets.precompile += %w( css/responsive.css )
Rails.application.config.assets.precompile += %w( css/style.css )
Rails.application.config.assets.precompile += %w( css/colors/green.css )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont93e3.svg )
Rails.application.config.assets.precompile += %w( fonts/fontello0bee.svg )
Rails.application.config.assets.precompile += %w( fonts/lineariconsca27.svg )
Rails.application.config.assets.precompile += %w( chosen.jquery.min.js )
Rails.application.config.assets.precompile += %w( custom.js )
Rails.application.config.assets.precompile += %w( headroom.min.js )
Rails.application.config.assets.precompile += %w( jquery-2.1.3.min.js )
Rails.application.config.assets.precompile += %w( jquery.counterup.min.js )
Rails.application.config.assets.precompile += %w( jquery.flexslider-min.js )
Rails.application.config.assets.precompile += %w( jquery.gmaps.min.js )
Rails.application.config.assets.precompile += %w( jquery.jpanelmenu.js )
Rails.application.config.assets.precompile += %w( jquery.magnific-popup.min.js )
Rails.application.config.assets.precompile += %w( jquery.sceditor.bbcode.min.js )
Rails.application.config.assets.precompile += %w( jquery.sceditor.js )
Rails.application.config.assets.precompile += %w( jquery.superfish.js )
Rails.application.config.assets.precompile += %w( jquery.themepunch.revolution.min.js )
Rails.application.config.assets.precompile += %w( jquery.themepunch.showbizpro.min.js )
Rails.application.config.assets.precompile += %w( jquery.themepunch.tools.min.js )
Rails.application.config.assets.precompile += %w( jquery-2.1.3.min.js )
Rails.application.config.assets.precompile += %w( stacktable.js )
Rails.application.config.assets.precompile += %w( switcher.js )
Rails.application.config.assets.precompile += %w( waypoints.min.js )
Rails.application.config.assets.precompile += %w( active_admin.js )
Rails.application.config.assets.precompile += %w( active_admin.css.scss )

