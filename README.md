# Serduk (SErving Ruby Directory Universal Kit)

Simple Ruby Web Framework designed mainly for learning Web Development for everyone. Inspired by PHP. To make a new Web page just create an html file which supports ERB. E.g. for https:://yoursite.com/products.html create page products.html with any Ruby code.

## Installation

Ruby programming language should be installed.

Install the gem by executing:

    $ gem install serduk

## Usage Examples

Create any HTML site that supports Ruby code in HTML/JSON pages using ERB:

~~~html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Using Ruby Code - Example</title>
</head>
<body>
  <h1>Server Time:</h1>

  <%= Time.now %>

  <p>Reload the page to get current time.</p>
</body>
</html>
~~~

Loop through collection:

~~~html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Loop through collection - Example</title>
</head>
<body>
  <h1>Users</h1>

  <% users = [{name: "Alice"}, {name: "Bob"}] %>

  <% for user in users %>
    <p>USER: <%= user[:name] %></p>
  <% end %>
</body>
</html>
~~~

## Templates Rendering

Create files `templates/header.html`, `templates/footer.html` containing site header and footer HTML respectively. Reuse the code in any HTML page:

~~~html
<%= render "templates/header", title: "About Us" %>

<h1>About Us</h1>
<p>Welcome to our bookstore! We are passionate about books and believe in the power of storytelling to inspire, educate, and entertain. Our mission is to provide a curated selection of quality books that cater to diverse interests and preferences.</p>
<p>At Bookstore, we strive to create a welcoming and inclusive environment where book lovers of all ages can explore new worlds, discover hidden gems, and connect with fellow enthusiasts. Whether you're a seasoned bibliophile or just beginning your reading journey, we're here to help you find your next great read.</p>
<p>Thank you for choosing Bookstore as your destination for literary adventures. We look forward to serving you and being a part of your reading adventures!</p>

<%= render "templates/footer" %>
~~~

## More Examples

See site example: https://github.com/webdeva2b/bookstore-ruby_pages-example-app

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shhavel/serduk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
