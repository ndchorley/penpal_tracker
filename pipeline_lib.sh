PYTHON="python3"

function select_python_version() {
    OS=$(uname)

    if [ "$OS" = "Linux" ];
    then
        PYTHON="python3.10"
    fi
}

function run_smoke_tests() {
    select_python_version

    $PYTHON smoke_test.py
}
