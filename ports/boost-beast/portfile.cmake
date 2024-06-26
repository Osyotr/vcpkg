# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/beast
    REF boost-${VERSION}
    SHA512 c7d168338a175035e1aca95ea282f6a8b08b0c4444f7736f9b8777ea30ad242f08f600761f4b8f22413b1f17a4c20a237dfefefba3854cde990a9440614f68b5
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
