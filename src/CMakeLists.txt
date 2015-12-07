#===========================================================================
# FILE:  iGPS/src/CMakeLists.txt
# DATE:  2015/12/07
# INFO:  Source-level CMakeLists.txt file for the moos-ivp-extend project
# NAME:  Maintained by Mohamed Saad IBN SEDDIK 
#        from original file moos-ivp-extend/CMakeLists.txt
#===========================================================================

FILE(GLOB LOCAL_LIBRARY_DIRS ./lib_*)
INCLUDE_DIRECTORIES(${LOCAL_LIBRARY_DIRS})

SET(SRC 
  GPS.cpp
  GPS_Info.cpp
  main.cpp
)

ADD_EXECUTABLE(iGPS ${SRC})

TARGET_LINK_LIBRARIES(iGPS
  ${MOOS_LIBRARIES}
  ${MOOSGeodesy_LIBRARIES}
  mbutil
  m
  pthread
)