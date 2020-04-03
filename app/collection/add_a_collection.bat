ECHO OFF
COLOR 0A
CLS

ECHO Let's make a new collection of information.
PAUSE
:start

ECHO ----------------------
:item
ECHO What is this ITEM called?
SET /p item=
IF [%item%]==[] (
    COLOR 0E
    ECHO --- You must name this item!
    GOTO item
)
IF EXIST %item% (
    COLOR 0E
    ECHO --- This item already exists!
    ECHO --- Please edit the existing files.
    ECHO --- The existing files can be found in "collection".
    PAUSE
    EXIT
)

ECHO ----------------------
COLOR 0A
:username
ECHO What is the USERNAME or EMAIL?
ECHO (If none, leave blank.)
SET /p username=



ECHO ----------------------
COLOR 0A
:password
ECHO What is the PASSWORD?
ECHO (If none, leave blank.)
SET /p password=

ECHO ----------------------
COLOR 0A
:website
ECHO What is the WEBSITE?
SET /p website=

ECHO ----------------------
COLOR 0A
:extra
ECHO Is there anything EXTRA?
ECHO (If not, leave blank.)
SET /p extra=

ECHO ----------------------
COLOR 0A
:accept
ECHO Is this information correct?
ECHO ITEMNAME - %item%
ECHO USERNAME - %username%
ECHO PASSWORD - %password%
ECHO WEB SITE - %website%
ECHO ADDITION - %extra%
ECHO (y / n)?
SET /p accept=

IF NOT %accept%==y ECHO That's okay, let's start over.
IF NOT %accept%==y PAUSE
IF NOT %accept%==y GOTO start

IF NOT EXIST %item% mkdir %item%
CD %item%

echo %username% > username.txt
echo %password% > password.txt
echo %website% > website.txt
echo %extra% > extra.txt
