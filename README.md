# bike-shop
Проект на Node.js, который реализует CRUD (Create, Read, Update, Delete) для веломагазина. Использует Express.js в качестве фреймворка для создания сервера и MongoDB в качестве базы данных.

## Run
```
npm install
node app.js
```
## Endpoints
1) CREATE:
```
curl -X POST \
  http://localhost:3000/bikes \
  -H 'Content-Type: application/json' \
  -d '{"name": "Mountain Bike", "price": 500, "description": "A great bike for mountains"}'
```
2) READ ALL:
```
curl -X GET http://localhost:3000/bikes
```
3) READ ONE:
```
curl -X GET http://localhost:3000/bikes/123
```
4) UPDATE:
```
curl -X PUT \
  http://localhost:3000/bikes/<id> \
  -H "Content-Type: application/json" \
  -d '{"name": "Updated Bike", "price": 600, "description": "An updated description for the bike"}'

```
5) DELETE:
```
curl -X DELETE http://localhost:3000/bikes/123
```
