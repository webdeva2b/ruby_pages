# frozen_string_literal: true

RSpec.describe "Example HTML site", type: :request do
  let(:app) { Serduk }
  before do
    bookstore_working_dir = File.join(__dir__, "bookstore")
    allow(Dir).to receive(:getwd).and_return(bookstore_working_dir)
  end

  it "renders index html" do
    get "/"

    expect(last_response).to be_ok
    expect(last_response.headers["content-type"]).to eq("text/html")
    expect(last_response.body).to include "<h1>Welcome to Our Bookstore</h1>"
  end

  it "renders page html" do
    get "/books.html"

    expect(last_response).to be_ok
    expect(last_response.headers["content-type"]).to eq("text/html")
    expect(last_response.body).to include "<h1>Our Books</h1>"
    expect(last_response.body).to include '<li><a href="/books/the-secret-garden.html">The Secret Garden</a> by Frances Hodgson Burnett</li>'
    expect(last_response.body).to include "<title>Our Books - Bookstore</title>"
  end

  it "renders partial html" do
    get "/books.html"

    expect(last_response).to be_ok
    expect(last_response.body).to include '<header class="header">'
    expect(last_response.body).to include '<div class="container">'
    expect(last_response.body).to include '<h2><a href="/">Bookstore</a></h2>'
  end

  it "renders partial with local variable" do
    get "/books/harry-potter-and-the-sorcerers-stone.html"

    expect(last_response).to be_ok
    expect(last_response.body).to include "<title>Harry Potter and the Sorcerer's Stone - buy a book - Bookstore</title>"
  end

  it "returns css" do
    get "/css/styles.css"

    expect(last_response).to be_ok
    expect(last_response.headers["content-type"]).not_to eq("text/html")
  end

  it "returns favicon" do
    get "/favicon/favicon-32x32.png"

    expect(last_response).to be_ok
    expect(last_response.headers["content-type"]).not_to eq("text/html")
  end

  it "renders 404 page" do
    get "/unknown.html"

    expect(last_response).to be_not_found
    expect(last_response.headers["content-type"]).to eq("text/html")

    expect(last_response.body).to include "<h1>404 Not Found</h1>"
    expect(last_response.body).to include "<p>Oops! The page you're looking for does not exist: /unknown.html.</p>"
    expect(last_response.body).to include '<p>Return to <a href="/">home</a>.</p>'
  end
end
