function generate_version_module() {
    rm bin/version.ml

    cp bin/version.ml.template bin/version.ml

    local BUILD_COMMIT_HASH=$1
    sed -i "s/{BUILD_COMMIT_HASH}/$BUILD_COMMIT_HASH/" bin/version.ml
}
