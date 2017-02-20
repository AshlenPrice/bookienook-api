API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/reviews"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"\

  --data '{
    "review": {
      "review_content": "'"${REVIEW_CONTENT}"'",
      "user_id": "'"${USER_ID}"'",
      "book_id": "'"${BOOK_ID}"'"
        }
  }'

echo
