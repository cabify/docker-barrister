# docker-barrister
Docker container with barrister utility and some handy tools.

Includes `idl2go` from [barrister-go](https://github.com/coopernurse/barrister-go)

## Why?

Because you don't want to `pip install barrister` tools on your machine.

## Usage

For JSON barrister definition generation from the IDL file you can run:
```bash
cat definition.idl | docker run -i cabify/barrister barrister > definition.json
```
It's much easier (from command line params length point of view) to interact with this tool through stdin and stdout.

## Usage for Go

This container includes the idl2go, which you can use by calling
```bash
docker run -i cabify/barrister idl2go
```
There's also a wrapper called `barrister2go` which does both things, it accepts the package as unique param,
reads the IDL from STDIN and writes the Go code into STDOUT, use it like this:
```bash
cat definition.idl | docker run -i cabify/barrister barrister2go pkg > my/pkg.go
```

You'll probably want to pipe the output through your local go formatting tool, like `goimports`.
