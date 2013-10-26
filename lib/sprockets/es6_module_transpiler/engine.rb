require 'sprockets/es6_module_transpiler'

if defined?(Rails)
  module Sprockets
    class ES6ModuleTranspiler

      class Engine < ::Rails::Engine
        initializer :setup_es6_module_transpiler, :after => "sprockets.environment", :group => :all do |app|
          app.assets.register_postprocessor 'application/javascript', ES6ModuleTranspiler
        end
      end

    end
  end
end
