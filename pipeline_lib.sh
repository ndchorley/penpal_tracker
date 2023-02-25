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

function run_stage_and_exit_on_failure() {
    local STAGE_NAME=$1
    local COMMAND=$2

    echo -e "Running $STAGE_NAME...\n"

    $COMMAND

    if [ $? -eq 0 ];
    then
        echo -e "\033[0;32m$STAGE_NAME succeeded\033[0m"
    else
        echo -e "\033[0;31m$STAGE_NAME failed\033[0m"
        exit $?
    fi

    echo -e "\n"
}
