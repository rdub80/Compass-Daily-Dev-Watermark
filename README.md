# Compass Daily Dev Watermark

## Description
Ruby function & Sass Mixin for adding a datetime stamp to the compiled CSS and adding dated & commented watermarks to the body tag.

### Requirements
- [Ruby Sass 3.2+](http://www.ruby-lang.org/en/documentation/installation/)
- [Compass 1.0.3+](http://compass-style.org/install/)

### Usage
1. Add ruby module to the bottom of the `config.rb` file
  	```Ruby
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
    ```

2. Add `#{timestamp()}` on the top of your `main.scss` file:
    ```scss
	/*!
	 * CSS Compiled on: #{timestamp()}
	 */
    ```
    output:
    ```css
    /* CSS Compiled on: 2016-06-04 12:00:00 -0400 */
    ```
Alternatively, for Unix-style time stamp, use `#{unix_timestamp()}`.


3. Add following code to your `main.scss` file:

	Add `@import "compass/css3"`

	Define variable to set development watermark `true/false`

    ```scss
	// for development tracking
	$devmode:true;
    ```

	SASS Mixin
    
    ```scss
	@mixin dev($devmode, $msg:"", $today: "#{today()}") {
	   @if ($devmode) {
	        &:after { //for development only
	            content: 'updated '+ $today + $msg;
	            position: fixed;
	            top: 1rem;
	            right: 1rem;
	            background: #fff;
	            @include box-shadow(4px 4px 8px 0px rgba(0,0,0,0.12));
	            @include border-radius(20px);
	            @include opacity(0.8);
	            text-align: center;
	            padding: 0 1rem;
	            font-family: courier;
	            color:#333;
	            z-index: 10000;
	        }
	    }
	}
	```

4. Paste the Mixin into your `.scss` files

    ```scss
    @include dev($devmode, " - your comment here");
	```

### Example:

```scss
/* Small Screen Mobile ----------- */
@media only screen and (max-width: 480px) {
  body{
    @include dev($devmode, " - Small Screen Mobile");
  }
}
```

output:

```css
/* Small Screen Mobile ----------- */
@media only screen and (max-width: 480px) {
	body:after {
		content: "updated 06/04 - Small Screen Mobile";
		position: fixed;
		top: 1rem;
		right: 1rem;
		background: #fff;
		-moz-box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.12);
		-webkit-box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.12);
		box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.12);
		-moz-border-radius: 20px;
		-webkit-border-radius: 20px;
		border-radius: 20px;
		filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
		opacity: 0.8;
		text-align: center;
		padding: 0 1rem;
		font-family: courier;
		color: #333;
		z-index: 10000;
    }
}
```

### Dependencies
- Normalize v4.1.1 
- Modernizr 2.8.3
- jQuery v1.12.0

