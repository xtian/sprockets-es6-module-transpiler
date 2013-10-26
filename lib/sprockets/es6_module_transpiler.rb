require "open3"
require "sprockets"
require "tilt"

module Sprockets
  class ES6ModuleTranspiler < Tilt::Template
    attr_reader :data
    attr_reader :scope

    def prepare
    end

    def evaluate(scope, locals, &block)
      @data  = data
      @scope = scope

      dependencies.each do |dep|
        scope.require_asset dep
      end

      stdin, stdout = transpiler

      stdin.write data
      stdin.close

      stdout.read
    end

    def dependencies
      deps =  data.scan(/\bfrom *["'](.+)["']/)
      deps += data.scan(/\bimport *["'](.+)["']/)

      deps.flatten
    end

  private

    def gem_dir
      File.join(File.expand_path(File.dirname(__FILE__)), "../..")
    end

    def module_name
      scope.logical_path.gsub(/^\.?\//, "")
    end

    def transpiler
      Open3.popen3(transpiler_executable, "--stdio", "--module-name", module_name)
    end

    def transpiler_executable
      @transpiler_executable ||= File.join(gem_dir, "node_modules/.bin/compile-modules")
    end
  end
end
