require 'compass/import-once/activate'
# Require any additional compass plugins here.

http_path = "/"
css_dir = "css"
sass_dir = "sass"
images_dir = "img"
javascripts_dir = "javascripts"
fonts_dir = "fonts"

output_style = :expanded
sourcemap = false

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true
relative_assets = false
sass_options = {:debug_info=>false}

line_comments = false

preferred_syntax = :scss

module Sass::Script::Functions
    def timestamp()
        return Sass::Script::String.new(Time.now.to_s)
    end

    def unix_timestamp()
      return Sass::Script::String.new(Time.now.to_i.to_s)
    end

    def today()
        return Sass::Script::String.new(Time.now.strftime("%m/%d"))
    end

end