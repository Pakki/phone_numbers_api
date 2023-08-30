## Phone numbers DB API

#### Requiments:

- Ruby version 3.2.2
- Ruby on Rails version 7.0.7

#### How it works:

- To take all phone numbers from DB: run

```
curl -X GET http://127.0.0.1:3000/api/v1/phone_numbers
```

- Find one current phone number

```
curl -X GET http://127.0.0.1:3000/api/v1/phone_numbers/find/89645983303
```

- Fill DB from a Excel book (xlsx) with phone numbers (see phone_numbers.xlsx). Phone numbers should be written in the first column of the first sheet of the book.

```
curl -F 'file=@phone_numbers.xlsx' -F 'format=XLSX' http://127.0.0.1:3000/api/v1/phone_numbers
```
