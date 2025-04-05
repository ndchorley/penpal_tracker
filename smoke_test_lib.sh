function select_python_version() {
    local OS=$(uname)

    if [ "$OS" = "Linux" ];
    then
        echo "python3.11"
    else
        echo "python3"
    fi
}
