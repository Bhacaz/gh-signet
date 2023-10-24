# GH Signet

https://gh-signet.app.bhacaz.com

<img width="1448" alt="image" src="https://github.com/Bhacaz/journee-carriere-css-participants/assets/7858787/868e5be4-9cf1-4547-b4b6-4e63fa8ed8a4">

* GitHub oauth app

1. Create a new GitHub oauth app https://github.com/settings/applications/new
2. Set the callback url to `http://localhost:3000/auth/github/callback`
3. Set the client id and client secret with `bin/rails credentials:edit`

```yaml
github:
  secret: 123
  client_id: 123
```
