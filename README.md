# Vecos

Releezme Vecos locker management API wrapper

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     vecos:
       github: place-technology/vecos
   ```

2. Run `shards install`

## Usage

```crystal
require "vecos"

client = Vecos::Client.new("<CLIENT ID>", "<CLIENT SECRET>", "<USERNAME>", "<PASSWORD>")
pp client.companies.list
```

## Contributing

1. Fork it (<https://github.com/place-technology/vecos/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Giorgi Kavrelishvili](https://github.com/place-technology) - creator and maintainer
