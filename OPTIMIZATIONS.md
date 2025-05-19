# BlockBody render benchmark

This benchmark measures the speed of rendering a template with many tags to exercise `BlockBody#render_to_output_buffer`.

Command:

```
bundle exec ruby performance/unit/block_body_render_benchmark.rb
```

## Results

### Before caching `resource_limits`

```
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +YJIT +PRISM [x86_64-linux]
Warming up --------------------------------------
    render many tags   213.000 i/100ms
Calculating -------------------------------------
    render many tags      2.206k (±11.2%) i/s  (453.36 μs/i) -     21.939k in  10.105145s
```

### After caching `resource_limits`

```
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +YJIT +PRISM [x86_64-linux]
Warming up --------------------------------------
    render many tags   191.000 i/100ms
Calculating -------------------------------------
    render many tags      2.176k (±12.3%) i/s  (459.64 μs/i) -     21.392k in  10.030115s
```
