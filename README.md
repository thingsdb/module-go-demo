# Demo ThingsDB Module (Go)

Demo module written using the [Go language](https://golang.org).


## Installation

Install the module by running the following command in the `@thingsdb` scope:

```javascript
new_module('demo', 'github.com/thingsdb/module-go-demo');
```

Optionally, you can choose a specific version by adding a `@` followed with the release tag. For example: `@v0.1.0`.

## Configuration

*This module does *not* require any config.*


## Exposed functions

Name          | Description
------------- | -----------
[echo](#echo) | Accepts an input message (string) and returns the same message back.


### echo

Syntax: `echo(message)`

#### Arguments

- `message`: The string which will be returned.

#### Example:

```javascript
demo.echo("Hi Demo module!").then(|reply| {
    reply;  // just return the reply.
});
```
