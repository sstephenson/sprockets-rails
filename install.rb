require "fileutils"

FileUtils.cp File.join(File.dirname(__FILE__), "config", "sprockets.yml"),
             File.join(File.dirname(__FILE__), "..", "..", "..", "config")
