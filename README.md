# qmlfmt-docker
qmlfmt - command line application that formats QML files
This is dockerized version of [jesperhh/qmlfmt](https://github.com/jesperhh/qmlfmt)

## Usage

docker run strixcode/qmlfmt

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

