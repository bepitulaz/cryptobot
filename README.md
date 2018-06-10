# CryptoBot

Common Lisp Facebook messenger bot for Cryptocurrency information and news.

## How to run it

I use GNU Screen to deploy the bot.

```
sbcl --load setup.lisp \
--eval "(defvar cryptobot-sendapi:*page-access-token* "Your page access token")" \
--eval "(cryptobot:server-start)" \
--eval "(cryptobot-sendapi:get-started)"
```

## Current features

- Show the bot's services
- Show top 4 cryptocurrencies price ticker

## Roadmap

- Search cryptocurrency by its ticker symbol
- Aggregating news

## License

MIT