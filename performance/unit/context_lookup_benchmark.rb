# frozen_string_literal: true

require "benchmark/ips"
require 'liquid'

RubyVM::YJIT.enable if defined?(RubyVM::YJIT)

context = Liquid::Context.new({
  'foo' => 'bar',
  'nested' => { 'value' => 42 },
})

Benchmark.ips do |x|
  x.config(time: 10, warmup: 5)

  x.report("find_variable top level") do
    context.find_variable('foo')
  end

  x.report("find_variable nested") do
    context.find_variable('nested')
  end

  x.compare!
end
