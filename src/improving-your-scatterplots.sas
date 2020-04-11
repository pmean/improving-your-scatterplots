* improving.sas
  written by Steve Simon
  created 2020-04-11;

ods pdf
  file="/folders/myfolders/improving-your-scatterplots/src/improving.pdf";

filename raw_data
  "/folders/myfolders/improving-your-scatterplots/data/saratoga_housing.csv";

libname improve
  "/folders/myfolders/improving-your-scatterplots/data";

* Homework 04;

proc import
    datafile=raw_data
    out=improve.saratoga
    dbms=dlm
    replace;
  delimiter=',';
  getnames=yes;
run;

proc print
    data=improve.saratoga(obs=10);
run;

proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price;
run;

ods pdf close;
