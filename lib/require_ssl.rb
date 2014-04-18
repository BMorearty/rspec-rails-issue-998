module RequireSsl
  def self.included(base)
    base.class_eval do
      def self.require_ssl_force_domain(options)
        before_filter(options) do
          unless request.ssl?
            redirect_to protocol: 'https', host: 'example.com'
          end
        end
      end
    end
  end
end
