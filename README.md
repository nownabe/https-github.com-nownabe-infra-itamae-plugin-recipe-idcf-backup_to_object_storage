# Itamae::Plugin::Recipe::Idcf::BackupToObjectStorage

An itamae plugin to backup directories to IDCF Object Storage.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-idcf-backup_to_object_storage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-idcf-backup_to_object_storage

## Usage
### Recipe
In you recipe:

```ruby
include_recipe "idcf-backup_to_object_storage"
```

### Configuration
In you `node.yml` of `node.json`:

```yaml
idcf:
  backup_to_object_storage:
    access_key: YOUR_ACCESS_KEY
    secret_key: YOUR_SECRET_KEY
    directories:
      - schedule: 0 4 * * *
        path: /backup/path1
        bucket: backup.bucket1
        expire: 7 # Default: 7 days
      - schedule: 0 5 * * *
        path: /backup/path2
        bucket: backup.bucket2
        expire: 30
        command: tar zcf /backup/path2/backup_`date +\%Y\%m\%d\%H\%M`.tar.gz /backup/source
                 # This command is executed before backup to object storage
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-plugin-recipe-idcf-backup_to_object_storage/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
