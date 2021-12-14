# $Id$
# =============================================================
# 
# PROJECT  : FCI_COMPRESSION 
# 
# AUTHOR   : THALES Services
# 
# Copyright 2015 EUMETSAT
# 
# =============================================================
# HISTORY :
# 
# VERSION:1.0.1:NCR:FCICOMP-8:09/03/2016:Add the copyright notice in the header
#
# END-HISTORY
# =============================================================


# - Find CharLS, an optimized JPEG-LS compression library
#
# To provide the module with a hint about where to find your CharLS
# installation, you can set the environment variable CHARLS_ROOT.  The
# Find module will then look in this path when searching for CharLS
# paths, and libraries.
#
# This module will define the following variables:
# CHARLS_FOUND       - Indicates whether the library has been found at all
# CHARLS_LIBRARY     - Name of the library to link
# CHARLS_INCLUDE_DIR - Path to the header files to include
#

if(DEFINED ENV{CHARLS_ROOT})
  message(STATUS "CHARLS_ROOT defined: $ENV{CHARLS_ROOT}")
else()
  message(STATUS "CHARLS_ROOT not defined")
endif()

find_path(CHARLS_INCLUDE_DIR
  NAMES version.h public_types.h jpegls_error.h charls_legacy.h charls.h api_abi.h
  HINTS CHARLS_ROOT ENV CHARLS_ROOT
  PATH_SUFFIXES include/CharLS
  DOC "CharLS include directory."
)

if (CHARLS_INCLUDE_DIR)
  message(STATUS "CharLS include dir found: ${CHARLS_INCLUDE_DIR}")
else ()
  message(FATAL_ERROR "Couldn't find CharLS include dir!")
endif ()

find_library(CHARLS_LIBRARY
  NAMES CharLS charls
  HINTS CHARLS_ROOT ENV CHARLS_ROOT
  PATH_SUFFIXES lib
  DOC "CharLS library."
)

if (CHARLS_LIBRARY AND CHARLS_INCLUDE_DIR)
  set(CHARLS_LIBRARIES ${CHARLS_LIBRARY})
  set(CHARLS_INCLUDE_DIRS ${CHARLS_INCLUDE_DIR})
  set(CHARLS_FOUND "YES")
else ()
  set(CHARLS_FOUND "NO")
endif ()

if (CHARLS_FOUND)
  if(NOT CHARLS_FIND_QUIETLY)
    message(STATUS "Found CHARLS: ${CHARLS_LIBRARY}")
  endif()
else()
  if(CHARLS_FIND_REQUIRED)
    message(FATAL_ERROR "Couldn't find CharLS library!")
  endif()
endif()

mark_as_advanced(
  CHARLS_LIBRARY
  CHARLS_INCLUDE_DIR
)
