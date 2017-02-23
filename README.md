
# A Children's Book Review Datastore
This is an API to store reviews of children's books written by children.

### [Front-End Repo](https://github.com/AshlenPrice/bookienook)

## API End-Points

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| POST   | `/reviews`             | `reviews#create`  |
| GET    | `/reviews`             | `reviews#index`   |
| GET    | `/reviews/:id`         | `reviews#show`    |
| PATCH  | `/reviews/:id`         | `reviews#update`  |
| DELETE | `/reviews/:id`         | `reviews#destroy` |
| GET    | `/books`               | `books#index`     |
| GET    | `/books/:id`           | `booss#khow`      |

---

### User Actions

#### POST /sign-up

The `create` action expects a *POST* of `credentials` and `user` information identifying a new user and to create, in this case using `getFormFields`:

```html
<form>
  <input name="credentials[email]" type="text" value="a@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>
```
Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
  }'
```

```sh
EMAIL=A@A.com PASSWORD=Ash scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "A@A.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=A@A.com PASSWORD=Ash  scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "A@A.com",
    "token": "BAhJIiUyNjA2Y2EwYjIzYzU4OGQ5ZDdhY2YwZThlOGM2MzFhMAY6BkVG--9b4e60909025d8db3a9e3cf9fa156d0a851ba2e4"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
 TOKEN=BAhJIiUyNjA2Y2EwYjIzYzU4OGQ5ZDdhY2YwZThlOGM2MzFhMAY6BkVG--9b4e60909025d8db3a9e3cf9fa156d0a851ba2e4 scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1  TOKEN=BAhJIiUyNjA2Y2EwYjIzYzU4OGQ5ZDdhY2YwZThlOGM2MzFhMAY6BkVG--9b4e60909025d8db3a9e3cf9fa156d0a851ba2e4 ID=1 scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
 TOKEN=BAhJIiUyNjA2Y2EwYjIzYzU4OGQ5ZDdhY2YwZThlOGM2MzFhMAY6BkVG--9b4e60909025d8db3a9e3cf9fa156d0a851ba2e4 scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "A@A.com"
    }
  ]
}

```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2  TOKEN=BAhJIiUyNjA2Y2EwYjIzYzU4OGQ5ZDdhY2YwZThlOGM2MzFhMAY6BkVG--9b4e60909025d8db3a9e3cf9fa156d0a851ba2e4 scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### User Actions

All reviews action requests must include a valid HTTP header `Authorization: Token token=<token>` or they will be rejected with a status of 401 Unauthorized.

All actions in this API follow the RESTful style.

Books are visible to all, Reviews are associated with users. GET action requests can be made with no
Authorization required. If these requirement is unmet, the response will be 404 Not Found.
