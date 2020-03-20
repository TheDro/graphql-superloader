# GraphQL SuperLoader

The purpose of this project is to create a batch loader for GraphQL that introspects the models passed in and automatically pick a suitable loader among:

- RecordLoader
- ForeignKeyLoader
- ManyToManyLoader
- etc.

This will make it easier to use loaders and reduce bugs caused by the improper use of loaders.

## How to run
Configure the database

```terminal
bin/rails 
bin/rails s
```