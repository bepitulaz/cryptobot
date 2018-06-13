# CryptoBot

Facebook messenger bot for Cryptocurrency information and news. It uses Common Lisp.

![screen 1](screenshots/screen-1.jpg) ![screen 2](screenshots/screen-2.jpg)

## How to run it

The easiest way is using [GNU Screen](https://www.gnu.org/software/screen/).

```
$ screen
```

Then load and and run the system. I use [Steel Bank Common Lisp (SBCL)](http://www.sbcl.org) compiler.

```
$ sbcl --load setup.lisp \
--eval "(defvar cryptobot-sendapi:*page-access-token* "Your page access token")" \
--eval "(cryptobot:server-start)" \
--eval "(cryptobot-sendapi:get-started)"
```

Detach the current screen by using `ctrl+a d`.

## Current features

- Show the bot's services
- Show top 4 cryptocurrencies price ticker

## Roadmap

- Search cryptocurrency by its ticker symbol
- Aggregating news

## License

MIT