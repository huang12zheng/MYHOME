@echo off

Rem $Header: install/utl/scripts/db/deinstall.bat /st_install_11.2.0.1.0/3 2010/02/18 22:36:21 ssampath Exp $
Rem
Rem Copyright (c) 2005, 2010, Oracle and/or its affiliates. 
Rem All rights reserved. 
Rem
Rem    NAME
Rem      deinstall.bat - wrapper script that calls deinstall tool.
Rem
Rem    DESCRIPTION
Rem      This script will determine the tool directory, cd to it and call the 
Rem      deinstall.pl script
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    ssampath    01/18/10 - Pass bootstrap location to bootstrap.pl and
Rem                           deinstall.pl
Rem    vkoganol    10/14/09 - using deleyedexpansion feature to fix bug8988606.
Rem                           Alternate approach use goto
Rem    ssampath    08/24/09 - XbranchMerge ssampath_cleanup_deinstall_scripts
Rem                           from main
Rem    ssampath    08/20/09 - Comment debug statements
Rem    prsubram    08/17/09 - XbranchMerge
Rem                           prsubram_deinstall_txn_for_including_pl_file from
Rem                           main
Rem    dchriste    03/17/09 - Creation Windows version for new perl deinstall.
Rem    dchriste    03/17/09 - Creation Windows version for new perl deinstall.
Rem    ssampath    04/08/08 - 
Rem    khsingh     02/25/07 - 
Rem    aime        11/15/06 - change PATH.
Rem    aime        08/17/06 - 
Rem    ssampath    04/04/06 - Creation Windows version.
Rem

@setlocal
@setlocal enabledelayedexpansion

FOR /F "tokens=2-4 delims=/ " %%%%a in ('echo %date%') do (set mydate=%%%%c-%%%%a-%%%%b)
FOR /F "tokens=1-4 delims=.: " %%%%i in ('echo %time%') do (set mytime=%%%%i-%%%%j-%%%%k)
set dateTime=%mydate%_%mytime%

set INSTALLED_VERSION_FLAG=%setInstallFlag%

if (%INSTALLED_VERSION_FLAG%)==(true) (
      set oracleHomeVersion=1
      set bootstrapLocation=%TEMP%\OraDeinstall%dateTime%
) else (
      set oracleHomeVersion=0
)

REM echo ORACLE_HOME = %ORACLE_HOME%
REM echo oracleHomeVersion = %oracleHomeVersion%

@set currDir=%CD%
REM echo currDir = %currDir%
@set toolPath=%~dp0
REM echo toolPath = %toolPath%

if %oracleHomeVersion% == 1 (
      REM %ORACLE_HOME% will get instantiated to the value of "installed" home location
      ECHO Checking for required files and bootstrapping ...
      ECHO Please wait ...
      REM Execute boostrap.bat
      %ORACLE_HOME%\deinstall\utl\bootstrap.bat %bootstrapLocation% %ORACLE_HOME%

      REM Execute startup.bat from %TEMP% to prevent "The system cannot find 
      REM the path specified." error because batch processing is line-by-line
      %TEMP%\startup.bat %oracleHomeVersion% %bootstrapLocation% %ORACLE_HOME% %*
) else (
      REM Execute startup.bat
      %toolPath%utl\startup.bat %oracleHomeVersion% %toolPath% %*
)
