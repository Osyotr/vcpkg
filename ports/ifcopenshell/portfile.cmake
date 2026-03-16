vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO IfcOpenShell/IfcOpenShell
    REF "ifcopenshell-python-${VERSION}"
    SHA512 6a841d4c08ae5f5077adb12ec67ae02665b9c29d0dcaaf47fadb5bb61ef2d1d5671185ee8d764e70143451da4489ef02e74027900d23de91468eff8e1a938da9
    HEAD_REF master
    #PATCHES
        #cmake-config.patch
)

file(REMOVE "${SOURCE_PATH}/cmake/HDF5Config.cmake")
file(REMOVE "${SOURCE_PATH}/cmake/FindLibXml2.cmake")
file(REMOVE "${SOURCE_PATH}/cmake/FindOpenCASCADE.cmake")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        "ifcgeom" BUILD_IFCGEOM
        "opencascade" WITH_OPENCASCADE

        # TODO features:
        "convert" BUILD_CONVERT # Build IfcConvert executable
        "geomserver" BUILD_GEOMSERVER # Build IfcGeomServer executable
        "examples" BUILD_EXAMPLES # Build example applications
        "cgal" WITH_CGAL # Enable geometry interpretation using CGAL
        "collada" COLLADA_SUPPORT # Build IfcConvert with COLLADA support
        "gltf" GLTF_SUPPORT # Build IfcConvert with glTF support
        "ifcmax" BUILD_IFCMAX # Build IfcMax, a 3ds Max plug-in
        "hdf5" HDF5_SUPPORT # Enable HDF5 support
        "proj" WITH_PROJ # Enable output of Earth-Centered Earth-Fixed glTF output using the PROJ library
        "python" BUILD_IFCPYTHON # Build IfcPython
        "qt" BUILD_QTVIEWER # Build IfcOpenShell Qt GUI Viewer
        "usd" USD_SUPPORT # Build IfcConvert with USD support
        "ifcxml" IFCXML_SUPPORT # Build IfcParse with ifcXML support
)

# TODO options:
# PYTHON_MODULE_INSTALL_DIR

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/cmake"
    OPTIONS
        ${FEATURE_OPTIONS}
        "-DSCHEMA_VERSIONS=2x3;4;4x3_add2" # https://github.com/IfcOpenShell/IfcOpenShell/issues/1029#issuecomment-1882752366
        -DBUILD_DOCUMENTATION=OFF
        -DUSE_MMAP=OFF
        -DCMAKE_REQUIRE_FIND_PACKAGE_Eigen3=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME IfcOpenShell CONFIG_PATH share/IfcOpenShell)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.LESSER")
