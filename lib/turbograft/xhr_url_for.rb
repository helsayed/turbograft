module TurboGraft
  # Corrects the behavior of url_for (and link_to, which uses url_for) with the :back
  # option by using the X-XHR-Referer request header instead of the standard Referer
  # request header.
  module XHRUrlFor
    def self.included(base)
      base.alias_method :url_for_without_xhr_referer, :url_for
      base.alias_method :url_for, :url_for_with_xhr_referer

    end

    def url_for_with_xhr_referer(options = {})
      options = (controller.request.headers["X-XHR-Referer"] || options) if options == :back
      url_for_without_xhr_referer options
    end
  end
end
