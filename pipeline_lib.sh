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

function latest_commit_hash() {
    git log --pretty=oneline | head -n 1 | awk '{print $1}'
}
