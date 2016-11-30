# raspWatch
is a local task managing and error reporting site. Currently not deployed but will be in the foreseeable future. Feel free to branch, implement some nifty changes and make a pull request!

This software will be used to gather message and log data from an bunch of Rasberries that are used by teachers in different classrooms to play media or edit documents. Errors and such are reported to this server every night and collected.

The messages are put into tasks that can be assigned, move through a work cycle and finaly become done or even unresolved in special cases. There are several different ways of displaying the tasks.

A simple (and actually incomplete) user (and permission) system is in place to allow all users to view tasks, some to self assign and administrators to fully manipulate tasks.

Bootstrap v4.0.0-alpha.5 is used to make everything much prettier and to give pages a nice layout.

The repo is the htdocs folder of an Apache PHP server using MySQL (MariaDB).

The current layout of the database is stored in a SQL dump.

