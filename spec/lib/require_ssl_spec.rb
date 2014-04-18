require 'spec_helper'
require 'require_ssl'

describe RequireSsl, type: :controller do
  controller(ApplicationController) do
    include RequireSsl
    require_ssl_force_domain only: :index

    def new; render text: "new"; end
    def index; render text: "index"; end
  end

  it "works if you don't try to redirect" do
    get :new
  end

  it "requires ssl for the index action" do
    get :index
  end
end
