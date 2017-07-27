##########################################################################################################################################################################
# Name : English.nsh
# Object : NSIS file for English Language
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

; Mui
LangString Mui_Page_Title ${LANG_ENGLISH} "Installation of ${PRODUCT_NAME}"
LangString Mui_Page_Subtitle ${LANG_ENGLISH} "Please complete all informations."
LangString DESC_SectionActivePerl ${LANG_ENGLISH} "Installation d'ActivePerl."
LangString DESC_SectionWinAdminPassword ${LANG_ENGLISH} "Installation de WinAdminPassword version ${PRODUCT_VERSION}."

; Section
LangString Mui_Section_Appli ${LANG_ENGLISH} "Installation of appli ${PRODUCT_VERSION}."

; Status
LangString Status_Installation ${LANG_ENGLISH} "Installation..."
LangString Status_Perl ${LANG_ENGLISH} "ActivePerl Installation..."
LangString Status_WinAdminPassword ${LANG_ENGLISH} "Launching WinAdminPassword..."

; Logs
LangString Log_Get_Params ${LANG_ENGLISH} "Get Params."
LangString Log_Verify_Params ${LANG_ENGLISH} "Params verification."
LangString Log_Source_Decompression ${LANG_ENGLISH} "Extract sources."
LangString Log_Installation ${LANG_ENGLISH} "Installation."
LangString Log_Check_If_Admin ${LANG_ENGLISH} "Check user privileges."
LangString Log_Perl_Decompression ${LANG_ENGLISH} "Extract ActivePerl setup."
LangString Log_Perl_Installation ${LANG_ENGLISH} "ActivePerl Installation."
LangString Log_WinAdminPassword_Decompression ${LANG_ENGLISH} "Extract WinAdminPassword tool."
LangString Log_WinAdminPasswordInstallation ${LANG_ENGLISH} "Launching WinAdminPassword."

; Warning
LangString Warning_Not_Admin ${LANG_ENGLISH} "You must be an administrator to install this software."
