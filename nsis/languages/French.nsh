##########################################################################################################################################################################
# Name : French.nsh
# Object : Fichier regroupant toutes les traductions du package NSIS pour la langue Française
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
LangString Mui_Page_Title ${LANG_FRENCH} "Installation de ${PRODUCT_NAME}"
LangString Mui_Page_Subtitle ${LANG_FRENCH} "Veuillez renseigner toutes les informations demandées."
LangString DESC_SectionActivePerl ${LANG_FRENCH} "Installation d'ActivePerl."
LangString DESC_SectionWinAdminPassword ${LANG_FRENCH} "Installation de WinAdminPassword version ${PRODUCT_VERSION}."

; Section
LangString Mui_Section_Appli ${LANG_FRENCH} "Installation de l'appli ${PRODUCT_VERSION}."
LangString Status_Perl ${LANG_ENGLISH} "Installation d'ActivePerl..."
LangString Status_WinAdminPassword ${LANG_ENGLISH} "Lancement de WinAdminPasswd..."

; Status
LangString Status_Installation ${LANG_FRENCH} "Installation de l'application..."

; Logs
LangString Log_Get_Params ${LANG_FRENCH} "Récupération des paramètres d'installation lancés en ligne de commande."
LangString Log_Verify_Params ${LANG_FRENCH} "Vérification des paramètres lancés en ligne de commande."
LangString Log_Source_Decompression ${LANG_FRENCH} "Décompression des sources."
LangString Log_Installation ${LANG_FRENCH} "Installation de l'application."
LangString Log_Check_If_Admin ${LANG_FRENCH} "Vérification des privilèges de l'utilisateur."
LangString Log_Perl_Decompression ${LANG_FRENCH} "Décompression des sources d'ActivePerl."
LangString Log_Perl_Installation ${LANG_FRENCH} "Installation d'ActivePerl."
LangString Log_WinAdminPassword_Decompression ${LANG_FRENCH} "Décompression des sources de WinAdminPasswd."
LangString Log_WinAdminPasswordInstallation ${LANG_FRENCH} "Lancement de WinAdminPassword."

; Warning
LangString Warning_Not_Admin ${LANG_FRENCH} "Vous devez être administrateur du poste pour installer cette application. L'installation va s'arrêter."
