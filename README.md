# [Unoffocial] City of Richmond GIS PostGIS instructions

The best way to load your database is directly from the shapefiles themselves
(available via the [Richmond GIS office FTP
site](ftp://ftp.ci.richmond.va.us/GIS/)).

**Steps**

1. Download the data
2. Create your PostGIS database
3. Extract the shapefiles
4. Generate SQL for shapefiles
5. Load data into the database

### Downloading the data

Refer to the GIS office FTP link above.

### Software requirements

First ensure that you have PostgreSQL and PosGIS installed. On a Mac the
simplest way to do this is install the latest version of
[Postgres.app](http://postgresapp.com/)
which is a bundled version of PostgreSQL 9.3 with PostGIS 2.0. On
Windows you should be able to use the binary installers for
[PostgreSQL](http://www.postgresql.org/download/windows/) and
[PostGIS](http://postgis.net/windows_downloads). If you're on Linux then
you should be able to use your native package manager just fine (e.g.
`apt-get install postgresql postgis`).

### Database

The scripts herein and elsewhere in the project refer to a database
called "richmond" so let's create a matching database. Assuming your
system user account has the right privileges, run the following commands
from your command prompt:

    psql -c "CREATE DATABASE richmond;"
    psql -d richmond -c "CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;"

Now you should have a PostGIS ready database.

*Why name it 'richmond' when it is just geographic data?* Because this
database should later include other data, for which the GIS data will
provide a useful foundation for further analysis.

### Extraction

Unzip the files...

The included shell scripts 'sqlgen.sh' and 'load.sh' can be used to
genearate the SQL for loading the data and loading the data,
respectively. The need to be copied to the directory where your
shapefiles reside (sorry) and executed from there.

    ./sqlgen.sh
    ./load.sh

Again, loading the data with the script as-is requires that your system
user account has the requisite database privileges.

### Problems and caveats

This is an effort to codify what I did on intially getting the data. I
may have inadvertently skipped or changed a step, so if there are any
problems let me know (ben@wellfire.co).
