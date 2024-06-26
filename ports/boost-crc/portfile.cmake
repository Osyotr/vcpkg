# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/crc
    REF boost-${VERSION}
    SHA512 fc5a56d954b99eb153d5c8a205d1130569b3d4fb59fe9e8a8ecd2df5de7bc4a59681ffa8aca07939242ef3a89e0dd83095eb015cb95e05a0863a26cabd598ac8
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
