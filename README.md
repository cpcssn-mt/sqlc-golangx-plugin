# sqlc-golangx-plugin

## Migrating from sqlc's built-in Go codegen

To use the sqlc-golangx-plugin WASM plugin for Go codegen, your config will instead look something like this:

```yaml
version: 2
plugins:
- name: golang
  wasm:
    url: (wasm artifact)
    sha256: ""
sql:
- schema: "query.sql"
  queries: "query.sql"
  engine: "postgresql"
  codegen:
  - plugin: golang
    out: "db"
    options:
      package: "db"
      emit_json_tags: true
      emit_pointers_for_null_types: true
      query_parameter_limit: 5
      overrides:
      - column: "authors.id"
        go_type: "your/package.SomeType"
      rename:
        foo: "bar"
```

The differences are:
* (pending)
