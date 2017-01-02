# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "bower_componenets")


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
#Rails.application.config.assets.precompile += [Rails.root.to_s + '/vendor/assets/bower_components/bootstrap-touchspin/src/jquery.bootstrap-touchspin.css']
#Rails.application.config.assets.precompile += [Rails.root.to_s + '/vendor/assets/bower_components/fancybox/source/jquery.fancybox.css']
#Rails.application.config.assets.precompile += [Rails.root.to_s + '/vendor/assets/bower_components/owl.carousel/dist/assets/owl.carousel.css']
#Rails.application.config.assets.precompile += %w(*.css *.scss)
