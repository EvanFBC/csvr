#csvr

##API 

###Open, Parse, and Create

Open and parse every line in CSV to the SQLite DB and Table you pick:

```
csvr = CSVR.open('path/to/file.csv')
csvr.create('db_name', 'table_name')
```


####Optional Parsing

CSVR.headers will skip over any column not specified
CSVR.rows will skip over any row that does not match one of the row values specified
Note: Headers and rows must be specified before CSVR.create

```
csvr = CSVR.open('path/to/file.csv')

(optional) csvr.headers = ['array','of','custom', 'headers]
(optional) csvr.rows = ['array', 'of' 'strings' 'to' 'parse']

csvr.create('db_name', 'table_name')

```

