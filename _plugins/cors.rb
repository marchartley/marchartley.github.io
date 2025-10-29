require "webrick"

Jekyll::Hooks.register :site, :after_init do |site|
  Jekyll.logger.info "CORS", "Dev CORS plugin starting (serving=#{site.config['serving']})"

  next unless site.config["serving"] # only when `jekyll serve` is running

  # Jekyll 3.9.x (github-pages) uses Jekyll::Commands::Serve::Servlet
  servlet =
    if Jekyll::Commands::Serve.const_defined?(:Servlet)
      Jekyll::Commands::Serve::Servlet
    elsif Jekyll::Commands::Serve.const_defined?(:WEBrickServlet)
      Jekyll::Commands::Serve::WEBrickServlet
    else
      nil
    end

  if servlet.nil?
    Jekyll.logger.warn "CORS", "Could not find a servlet class to patch"
    next
  end

  servlet.class_eval do
    # Add CORS to normal GET responses
    alias :do_GET_orig :do_GET
    def do_GET(req, res)
      do_GET_orig(req, res)
      res["Access-Control-Allow-Origin"] = "*"
      res["Access-Control-Allow-Methods"] = "GET, OPTIONS"
      res["Access-Control-Allow-Headers"] = "*"
    end

    # Handle preflight if the browser ever sends one
    def do_OPTIONS(req, res)
      res.status = 200
      res["Access-Control-Allow-Origin"] = "*"
      res["Access-Control-Allow-Methods"] = "GET, OPTIONS"
      res["Access-Control-Allow-Headers"] = req["Access-Control-Request-Headers"] || "*"
      res.body = ""
    end
  end

  Jekyll.logger.info "CORS", "Patched #{servlet} with CORS headers"
end
