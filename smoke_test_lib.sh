function select_python_version() {
    local OS=$(uname)

    if [ "$OS" = "Linux" ];
    then
        echo "python3.10"
    else
        echo "python3"
    fi
}
