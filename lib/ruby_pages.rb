# frozen_string_literal: true

require_relative "ruby_pages/version"

module RubyPages
  class MissingTemplateError < StandardError; end
  ALLOWED_EXTNAMES = Set.new(%w[.html .htm .css .ico .txt .jpg .jpeg .png .svg .webmanifest]).freeze
  FORBIDDEN_PATH_FRAGMENTS = ["", ".", ".."].freeze
  TEMPLATE_EXTNAMES = ["", ".html", ".erb", ".html.erb"].freeze

  def self.call(env)
    web_path_arr = env["PATH_INFO"].split("/").reject do |d|
      FORBIDDEN_PATH_FRAGMENTS.include?(d)
    end
    os_path = File.join(Dir.getwd, *web_path_arr)
    ext = File.extname(env["PATH_INFO"])
    if ext.empty?
      os_path = File.join(os_path, "index.html")
      ext = ".html"
    end
    render_file(env, os_path, ext)
  end

  def self.render_file(env, filename, ext)
    return render_404(env) unless ALLOWED_EXTNAMES.include?(ext) && File.file?(filename)
    body = File.read(filename)
    if ext == ".html" || ext == ".json"
      bind = binding
      bind.local_variable_set("env", env)
      body = ERB.new(body).result(bind)
    end
    [200, headers(ext), [body]]
  end

  def self.render_404(env)
    file404 = File.join(Dir.getwd, "404.html")
    bind = binding
    bind.local_variable_set("env", env)
    body = File.file?(file404) ? ERB.new(File.read(file404)).result(bind) : "Page Not Found Error."
    [404, {"content-type" => "text/html"}, [body]]
  end

  def self.headers(ext)
    return {"content-type" => "text/html"} if ext == ".html"
    return {"content-type" => "application/json"} if ext == ".json"
    {}
  end

  def self.render(partial, **options)
    partname = File.join(Dir.getwd, partial)
    TEMPLATE_EXTNAMES.each do |ext|
      filename = partname + ext
      if File.file?(filename)
        bind = binding
        options.each do |key, value|
          bind.local_variable_set(key, value)
        end
        return ERB.new(File.read(filename)).result(bind)
      end
    end
    raise MissingTemplateError, "Template partial #{partial} doesn't exist."
  end
end
