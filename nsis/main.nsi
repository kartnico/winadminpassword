##########################################################################################################################################################################
# Nom : main.nsi
# Objet : NSIS main file
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
##### Prerequisistes
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 	- makensis - >= Revision 2.46
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##### Description
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 	- LZMA compression.
#	- /S parameter for silent install
#	- /? parameter for help
#	- Log syntax -> nsislog::log "${LOGFILE}" "comments"
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Date			Author				Revision	Comments
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Sat August 06 2011	nicolas.bourges@isep.fr		1.0		First revision
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##########################################################################################################################################################################

#############
# Plugins
#############
!addplugindir ".\plugins"
!include "MUI2.nsh"
!include "InstallOptions.nsh"
!include "FileFunc.nsh"
!include "variables.nsh"
!include "EnvVarUpdate.nsh"

#############
# Paramètres
#############
ShowInstDetails nevershow
BrandingText "${BRANDING_TEXT}"
; Application name
Name "${APPLI} v${PRODUCT_VERSION}"
; Filename
OutFile ..\${PRODUCT_NAME}.exe
; Compression type
SetCompressor lzma
; Request application privileges for Windows Vista
RequestExecutionLevel admin

# Version information

VIProductVersion                  "${PRODUCT_VERSION}.0.0"
VIAddVersionKey  ProductName      "${APPLI}"
VIAddVersionKey  ProductVersion   "${PRODUCT_VERSION}"
VIAddVersionKey  FileVersion      "${PRODUCT_VERSION}"
VIAddVersionKey  FileDescription  "WinAdminPassword tool"
VIAddVersionKey  CompanyName      "Nicolas BOURGES"
VIAddVersionKey  LegalCopyright   "© 2011 Nicolas BOURGES. All rights reserved."
VIAddVersionKey  OriginalFilename "${PRODUCT_NAME}.exe"
VIAddVersionKey  InternalName     "${APPLI}"

#############
# Pages (MUI)
#############
!define MUI_ICON "images\WinAdminPassword.ico"
!define MUI_UNICON "images\WinAdminPassword.ico"
!define MUI_HEADERIMAGE
!define MUI_ABORTWARNING
!define MUI_ABORTWARNING_CANCEL_DEFAULT
!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_FINISHPAGE_SHOWREADME "$PROGRAMFILES\${APPLI}\README.TXT"

#############
# Macros
#############
!insertmacro MUI_PAGE_WELCOME
!define MUI_WELCOMEPAGE_TITLE_3LINES
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "licence.rtf"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_FINISH
!insertmacro GetParameters
!insertmacro GetOptions
; Optimisation for "solid" compression
!insertmacro MUI_RESERVEFILE_LANGDLL
; Macro for lang
!macro IncludeTranslation LanguageString
	!insertmacro MUI_LANGUAGE "${LanguageString}"
    !include "languages\${LanguageString}.nsh"
!macroend

#############
# Languages
############# 
; Traductions
!define IncludeTranslation "!insertmacro IncludeTranslation"
${IncludeTranslation} "French"
${IncludeTranslation} "English"

#############
# Functions
#############
!include "functions.nsh"

#############
# Sections
#############

; Main section
Section -Main
	; Do not print errors
	ClearErrors

	; Installation status
	SetDetailsPrint both
	DetailPrint "$(Status_Installation)"
	SetDetailsPrint none

	; Check if user is admin
	Call CheckIfAdmin
SectionEnd

; Section d'installation d'ActivePerl
Section "ActivePerl"
	; Do not print errors
	ClearErrors

	; Check if user is admin
	Call CheckIfAdmin

	; Installation status
	SetDetailsPrint both
	DetailPrint "$(Status_Perl)"
	SetDetailsPrint none

	; Extract sources
	nsislog::log "${LOGFILE}" "- $(Log_Perl_Decompression)"
	SetOutPath "${DECOMPRESSION_DIR}"
	SetOverwrite on
	File /r "setup\${ACTIVEPERL}"

	; Active Perl silent install
	nsislog::log "${LOGFILE}" "- $(Log_Perl_Installation)"
	ExecWait 'msiexec /quiet /l* "$TEMP\perl.log" /norestart /i "$TEMP\${ACTIVEPERL}" PERL_PATH=Yes PERL_EXT=Yes TARGETDIR="$PROGRAMFILES" ADDLOCAL="PERL_FEATURE"'

	; Delete setup file
	Delete "$TEMP\${ACTIVEPERL}"
SectionEnd

; Section d'installation de WinAdminPassword
Section "WinAdminPassword"
	; Do not print errors
	ClearErrors
	
	; Check if user is admin
	Call CheckIfAdmin
	
	; Installation status
	SetDetailsPrint both
	DetailPrint "$(Status_WinAdminPassword)"
	SetDetailsPrint none
	
	; Installation
	nsislog::log "${LOGFILE}" "- $(Log_WinAdminPasswordInstallation)"
	SetOutPath "$PROGRAMFILES\${APPLI}"
	SetOverwrite on
	File "..\${MAKEADMINPASSWD}"
	File "..\*.TXT"
	Delete "$PROGRAMFILES\${APPLI}\${MAKEADMINPASSWD}.pl"
	Rename "$PROGRAMFILES\${APPLI}\${MAKEADMINPASSWD}" "$PROGRAMFILES\${APPLI}\${MAKEADMINPASSWD}.pl"

	; $PATH
	${EnvVarUpdate} $0 "PATH" "A" "HKLM" "$PROGRAMFILES\${APPLI}"
	${EnvVarUpdate} $0 "PATHEXT" "A" "HKLM" ".PL"

	; Création du désinstalleur
        WriteUninstaller "$PROGRAMFILES\${APPLI}\uninstall.exe"

        ; Configuration de la base de registre
        WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}" "DisplayName" "${APPLI}"
        WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}" "DisplayVersion" "${PRODUCT_VERSION}"
        WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}" "DisplayIcon" '"$PROGRAMFILES\${APPLI}\uninstall.exe"'
        WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}" "HelpLink" "${PRODUCT_URL}"
        WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}" "Publisher" "${PRODUCT_PUBLISHER}"
        WriteRegStr HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}" "UninstallString" '"$PROGRAMFILES\${APPLI}\uninstall.exe"'
SectionEnd

; Section de désinstallation
Section "Uninstall"
        RMDir /r "$PROGRAMFILES\${APPLI}"
        Delete "$PROGRAMFILES\${APPLI}\uninstall.exe"
        DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_APPLI}"
	${un.EnvVarUpdate} $0 "PATH" "R" "HKLM" "$PROGRAMFILES\${APPLI}"
	${un.EnvVarUpdate} $0 "PATHEXT" "R" "HKLM" ".PL"
SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT "ActivePerl" $(DESC_SectionActivePerl)
  !insertmacro MUI_DESCRIPTION_TEXT "WinAdminPassword" $(DESC_SectionWinAdminPassword)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

#############
# Callback Functions
#############

Function .onInit
	; Get command line parameters
        ${GetParameters} $R0

        ${GetOptions} "$R0" "/?" $R1
                IfErrors +2 +1
                ; Print Help
                Call Help

	; Display lang choice
	!insertmacro MUI_LANGDLL_DISPLAY
	
	; Delete old log file
	IfFileExists ${LOGFILE} +1 +2
		Delete ${LOGFILE}
FunctionEnd

Function un.onInit
	!insertmacro MUI_UNGETLANGUAGE
FunctionEnd
