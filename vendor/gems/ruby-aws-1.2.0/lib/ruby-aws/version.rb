# Copyright:: Copyright (c) 2007 Amazon Technologies, Inc.
# License::   Apache License, Version 2.0

module RubyAWS
  SRC_PATH = " $URL: svn+ssh://rubyforge.org/var/svn/ruby-aws/tags/1.2.0/lib/ruby-aws/version.rb $ "
  SRC_PATH =~ /tags\/(\d+\.\d+\.\d+)\/.*\/ruby-aws\/version.rb/
  VERSION = ($1 || "0.0.1").freeze
end
