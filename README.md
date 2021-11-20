# qmlfmt-docker
qmlfmt - command line application that formats QML files

This is a dockerized version of [strixcode/qmlfmt](https://github.com/strixcode/qmlfmt)

## Usage

To process QML from standard input:

`cat file.qml | docker run -i strixcode/qmlfmt`

To process multiple files you need to bind mount a host folder:

`docker run -v $PWD/qml:/qml strixcode/qmlfmt /qml`


### User / Group Identifiers

When using qmlfmt bind mounts (-v flag) permissions issues can arise between the host OS and the container, to avoid this specify the user PUID and group PGID as environment variables. By default this container runs as user 1000 and group 1000. To run it as root use -e PUID=0, PGID is ignored in this case.

```
docker run -e PUID=$(id -u) -e PGID=$(id -g) -v $PWD/qml:/qml strixcode/qmlfmt -w /qml
```

### Options:
    Usage: qmlfmt [options] path

    Without an explicit path, it processes the standard input. Given a file, it operates on that file; given a directory, it operates on all qml files in that directory, recursively. (Files starting with a period are ignored.) By default, qmlfmt prints the reformatted sources to standard output.

    -?, -h, --help             Displays this help.
    -v, --version              Displays version information.
    -t, --tab-size <tab size>  How many spaces to replace tabs with
    -i, --indent <indent>      How many spaces to use for indentation
    -l, --list                 Do not print reformatted sources to standard
                               output. If a file's formatting is different from
                               qmlfmt's, print its name to standard output.
    -w, --overwrite            Do not print reformatted sources to standard
                               output. If a file's formatting is different from
                               qmlfmt's, overwrite it with qmlfmt's version.
    -e, --error                Print all errors.
    -d, --diff                 Do not print reformatted sources to standard
                               output. If a file's formatting is different than
                               qmlfmt's, print diffs to standard output.

### Arguments:
    path                       file(s) or directory to process. If not set,
                               qmlfmt will process the standard input.

