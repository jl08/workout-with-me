Rails.application.configure do
  config.image_urls = {
    weight_lifting: "https://pixabay.com/static/uploads/photo/2015/02/27/17/44/weights-652488_640.jpg",
    basketball: "https://pixabay.com/static/uploads/photo/2013/05/02/21/23/uss-nimitz-108622_640.jpg",
    tennis: "https://pixabay.com/static/uploads/photo/2015/09/10/19/36/tennis-934841_640.jpg",
    spin: "http://heuserhealth.com/wp-content/uploads/2014/01/iStock_000012790937Medium.jpg",
    running: "https://res.cloudinary.com/mapmyfitness/image/upload/f167687b598b4deb85a33a0af8d0083c",
    soccer: "https://pixabay.com/static/uploads/photo/2014/05/21/15/28/soccer-349821_640.jpg",
    crossfit: "http://crossfitmonarchy.com/wp-content/uploads/2013/01/1BAPOD-Wallpaper-GoalsAchievement-1024x681-1.jpg",
    yoga: "http://cdn.funcheap.com/wp-content/uploads/2015/08/Yoga-Class-Beach-6601.jpg",
    hiking: "http://www.lakearrowhead.com/img/hiking/hikers3.jpg",
    racquetball: "http://www.thejungleclub.com/wp-content/uploads/2014/12/racqtball-play.jpg"
  }
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
Paperclip.options[:command_path] = "/usr/local/bin/"