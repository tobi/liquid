# frozen_string_literal: true

require "benchmark/ips"
require 'liquid'

RubyVM::YJIT.enable if defined?(RubyVM::YJIT)

source = (['{{a}}'] * 1000).join(' ')
template = Liquid::Template.parse(source)
context = Liquid::Context.new('a' => 'x')

Benchmark.ips do |x|
  x.config(time: 10, warmup: 5)
  x.report("render many tags") do
    template.render!(context)
  end
  x.compare!
end
