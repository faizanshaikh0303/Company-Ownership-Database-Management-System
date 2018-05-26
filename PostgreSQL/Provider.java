/****************************************************************************
CSE532 -- Project 2
File name: Provider.java
Author(s): Siddharth Jain (111425239)
           Shubham Kumar Jain (111482623)

Brief description: Credentials for the database.

We, pledge our honor that all parts of this project were done by us alone and without 
collaboration with anybody else.
****************************************************************************/

package com.woco;

public interface Provider {
String username="postgres";
String pwd="password";
String connURL="jdbc:postgresql://localhost:5432/WOCO";
}
