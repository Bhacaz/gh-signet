# GH Signet

https://gh-signet.app.bhacaz.com

<img width="1432" height="859" alt="image" src="https://github.com/user-attachments/assets/9dbc0102-1515-4b30-8adc-d7c2b8f2e924" />


## Selfhost

### GitHub oauth app

1. Create a new GitHub oauth app https://github.com/settings/applications/new
2. Set the callback url to `http://localhost:3000/auth/github/callback`
3. Set the client id and client secret with `bin/rails credentials:edit`

```yaml
github:
  secret: 123
  client_id: 123
```
