UserAgent
=========

UserAgent is a Ruby tool that facilitates quick matches to the ***user agent***.


Getting Started
===============
1. Create an instance of UserAgent passing in the actual HTTP_USER_AGENT
2. Then you can then call methods such as webkit?, iphone?, windows?, etc
3. This will try to match any string that ends with '?'

```ruby
# Example code
user_agent = UserAgent.new("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31")
user_agent.webkit? # => true 
user_agent.iphone? # => false 
user_agent.windows? # => false 
user_agent.mac? # => true 
```

Usage with Rails
================
1. Place the user_agent.rb file in the "lib" directory of your app
2. Configure the autoload_paths to include the lib directory if not already so.
```ruby
# Add this line of code to config/application.rb
config.autoload_paths += %W(#{Rails.root}/lib)
```

3. Create an instance of UserAgent using a before_filter in the controllers that will need it or application_controller to be accessible to all. Get the HTTP_USER_AGENT directly from Rails.
```ruby
class PublicController < ApplicationController
  
  before_filter :initialize_user_agent

	def initialize_user_agent
		@user_agent = UserAgent.new(request.env['HTTP_USER_AGENT'])
	end

	# ...
end
```

4. Use this instance variable in the above specified controller and associated views to easily check for Browser, OS, or Device matches using the same methods as earlier.
```ruby
@user_agent.webkit? # => true 
@user_agent.iphone? # => false 
@user_agent.windows? # => false 
@user_agent.mac? # => true 
```

**Enjoy**
