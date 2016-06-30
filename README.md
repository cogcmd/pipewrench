# pipewrench

Miscellaneous helpers for working with Cog command pipelines

## Commands

* `pipewrench:for` - easily construct a list of inputs for the next command in the pipeline

## Permissions

 * None. All commands are set to `allow` by default.

## Examples

### pipewrench:for

```
> pipewrench:for member in neil geddy alex | raw
```

```
{
  "member": "neil"
}
```
```
{
  "member": "geddy"
}
```
```
{
  "member": "alex"
}
```

## License

[Apache 2](https://github.com/cogcmd/format/blog/master/LICENSE)
