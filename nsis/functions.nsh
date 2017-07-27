##########################################################################################################################################################################
# Name : functions.nsh
# Object : NSIS file for functions
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

; Print Help
Function Help
	; Print manual and quit
	MessageBox MB_OK "\
		$\n	- /S --> Silent Install \
		$\n	- /? --> Help"
	Abort
FunctionEnd

; Check if user is admin
Function CheckIfAdmin
	; Logs
	nsislog::log "${LOGFILE}" "- $(Log_Check_If_Admin)"
	
	; Get Username
	UserInfo::GetName
	Pop $0
	; Get privileges
	UserInfo::GetAccountType
	Pop $1
		; If admin user, continue else quit
		StrCmp $1 "Admin" +5 0
			; If silent install, don't print message
			IfSilent +2
				MessageBox MB_ICONSTOP "$(Warning_Not_Admin)"
				; Logs
				nsislog::log "${LOGFILE}" "- $(Warning_Not_Admin)"
				; Quit
				Abort
FunctionEnd
