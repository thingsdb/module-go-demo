#!/bin/bash
declare -a arr=(
    "linux/386"
    "linux/amd64"
    # "linux/arm"
    # "linux/arm64"
    # "freebsd/386"
    # "freebsd/amd64"
    # "freebsd/arm"
    # "freebsd/arm64"
    # "darwin/amd64"
)

if [ "$OUT" == "" ]
then
    OUT="bin/"
fi

PACKAGE=`go list`

echo "Build package: $PACKAGE"

output="\"main\": {"

for i in ${!arr[@]}; do
    IFS="/" read -ra osarch <<< "${arr[i]}"
    fn="${PACKAGE}_${osarch[0]}_${osarch[1]}"
    if [ $i -gt 0 ]
    then
        output="$output,"
    fi
    if [ "${osarch[0]}" == "windows" ]
    then
        fn="$fn.exe"
    else
        fn="$fn.bin"
    fi

    GOOS="${osarch[0]}" GOARCH="${osarch[1]}" go build -o "${OUT}$fn"
    output="$output\n    \"${arr[i]}\": \"@/$fn\""
done

output="$output\n}"

echo "DONE!"
echo
echo "Create release equal to this version, for example 0.1.0 and add the"
echo "following as \"main\" to your module.json file:"
echo "..."
echo -e "$output"