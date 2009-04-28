SET(GLPK_REGKEY "[HKEY_LOCAL_MACHINE\\SOFTWARE\\GnuWin32\\Glpk;InstallPath]")
GET_FILENAME_COMPONENT(GLPK_ROOT_PATH ${GLPK_REGKEY} ABSOLUTE)

FIND_PATH(GLPK_INCLUDE_DIR
  glpk.h
  PATHS ${GLPK_REGKEY}/include)

FIND_LIBRARY(GLPK_LIBRARY
  NAMES glpk
  PATHS ${GLPK_REGKEY}/lib)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLPK DEFAULT_MSG GLPK_LIBRARY GLPK_INCLUDE_DIR)

IF(GLPK_FOUND)
  SET(GLPK_INCLUDE_DIRS ${GLPK_INCLUDE_DIR})
  SET(GLPK_LIBRARIES ${GLPK_LIBRARY})
  SET(GLPK_BIN_DIR ${GLPK_ROOT_PATH}/bin)
ENDIF(GLPK_FOUND)

MARK_AS_ADVANCED(GLPK_LIBRARY GLPK_INCLUDE_DIR GLPK_BIN_DIR)

IF(GLPK_FOUND)
  SET(LEMON_HAVE_LP TRUE)
  SET(LEMON_HAVE_MIP TRUE)
  SET(LEMON_HAVE_GLPK TRUE)
ENDIF(GLPK_FOUND)
