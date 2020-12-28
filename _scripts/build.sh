DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
mkdir -p $DIR/../_bin
palm-package $DIR/../ -o $DIR/../_bin
