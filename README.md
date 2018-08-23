# Cryptocurrency converter

This API, which implements the converter from one given currency to another.

Exchange rates are taken from [CoinMarketCap](https://coinmarketcap.com) and updated every 5 minutes.

## Installation

```
git clone
```
Go to the directory, and run the `bundle` command to install it.
Run the migration:
```
rake db:migrate
```
Converter uses gem [Crono](https://github.com/plashchynski/crono) to run the job on a schedule.

Run it:
```
bundle exec crono RAILS_ENV=development
```
Start the server
```
rails s
```

## API methods:

List of active currencies / crypto currency:
```
'/list'
```
For convert calculate, enter - first currency/second currency/amount.
Example:
```
'/rub/btc/100/'
```
History of 20 last conversations:
```
'/history/'
```
You can specify the length of the history with the second parameter:
'/history/30'

## Tests

To run tests:
```
rspec
```
