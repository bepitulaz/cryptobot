# CryptoBot

Common Lisp Facebook messenger bot for Cryptocurrency information.

# How to run it

```
sbcl --load setup.lis --eval "(defvar cryptobot-sendapi:*page-access-token* "Your page access token")" --eval "(cryptobot:server-start)"
```

# License

MIT