##########################################################################################################################################################################
# Name : variables.nsh
# Object : NSIS file for variables
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##### Licence
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# WinAdminPassword - A utility to deploy unique passwords for Microsoft Windows and Unix systems. It is based on the serial number of computers and a private key.
# The advantage is that no password is stored in a database.
# Copyright (C) 2011 Nicolas BOURGES
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY. without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Date			Author				Revision	Comments
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Sat August 06 2011	nicolas.bourges@isep.fr		1.0		First revision
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##########################################################################################################################################################################


#############
# Variables
#############
!define APPLI "WinAdminPassword"
!define PRODUCT_APPLI "winadminpassword"
!define PRODUCT_VERSION "1.5"
!define PRODUCT_OS "all"
!define PRODUCT_LANG "multi"
!define PRODUCT_ARCH "x64"
!define PRODUCT_URL "http://winadminpasswd.sourceforge.net"
!define PRODUCT_PUBLISHER "Nicolas BOURGES"
!define ACTIVEPERL "ActivePerl-5.14.1.1401-MSWin32-x64-294969.msi"
!define MAKEADMINPASSWD "winadminpassword"
!define BRANDING_TEXT "http://winadminpasswd.sourceforge.net"
!define DECOMPRESSION_DIR "$TEMP"
!define LOGFILE "$TEMP\${PRODUCT_NAME}.log"
!define PRODUCT_NAME "${PRODUCT_APPLI}-${PRODUCT_VERSION}-${PRODUCT_ARCH}"
