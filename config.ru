use Rack::Static,
  :urls => ["/css", "/img", "/javascripts", "/"],
  :root => "public",
  :index => "index.html"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=300'
    }
  ]
}
