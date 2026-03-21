# Rails Application Templates

## Development

### Prerequisites

- Ruby >= 3.4
- Rails >= 8.1

### Lint

```bash
bundle exec rubocop
```

### Test Template

Generate a test app to verify the template works correctly:

```bash
TEST_APP=$(mktemp -d) && \
  rails new "$TEST_APP" --api -d postgresql --skip-test --skip-solid -m template/api.rb && \
  cd "$TEST_APP" && bundle exec rubocop --format simple && \
  cd - && rm -rf "$TEST_APP"
```

Expected: 0 offenses detected.

### Checklist

After modifying recipes or template files, verify:

- No `Bundler/DuplicatedGem` warnings (Rails 8.1 includes gems like `brakeman` and `rubocop-rails-omakase` by default; recipes must `gsub_file` them before re-adding)
- No orphaned comments left behind after `gsub_file` removals
- `bundle exec rubocop` passes with 0 offenses on the generated app
- New gems appear in the generated Gemfile with the correct group

## Project Structure

- `template/api.rb` - Main template entry point
- `recipe/*.rb` - Individual gem recipes (one per gem or tool)
- `recipe/config/*.rb` - Environment-specific configuration recipes
- `template/files/` - Static files copied into the generated project
- `lib/base.rb` - Helper functions and lifecycle hooks
