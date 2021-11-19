# Bashtetikn (website)

Website to help validate web pages. Gathers validation results from multiple sources, providing insight into current and historical issues. WebUI for [bashtetikn library](https://github.com/mattscilipoti/bashtetikn).

> bashtetikn: Yiddish for "To validate"

## Dockerized
- see https://dev.to/imiked/starting-a-rails-app-using-vscode-containers-1gj9
- You can open in VS Code, directly in a Docker Dev Environment

## Specs
- `$ rspec`, see: https://github.com/rspec/rspec-rails
- Factory Bot ♥ Rails, see: [Getting Started](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)
- [Faker](https://github.com/stympy/faker): generate fake data such as names, addresses, and BossaNova artists.

## Debugging
- Both pry and debugger are supported (via pry-byebug).
- add `debugger` or `binding.pry`

## Configured via Rails credentials
- see https://edgeguides.rubyonrails.org/security.html#environmental-security

## Monitoring
- Use `/heartbeat` for app monitoring services.
- via [rack-heartbeat](https://github.com/imajes/rack-heartbeat)

## View Templating via Slim

- Note: using logic-less: https://github.com/slim-template/slim/blob/master/doc/logic_less.md
