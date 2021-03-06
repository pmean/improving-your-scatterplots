* improving.sas
  written by Steve Simon
  created 2020-04-11;

filename raw_data
  "/folders/myfolders/improving-your-scatterplots/data/saratoga_housing.csv";

libname improve
  "/folders/myfolders/improving-your-scatterplots/data";

proc import
    datafile=raw_data
    out=improve.saratoga
    dbms=dlm
    replace;
  delimiter=',';
  getnames=yes;
run;

data improve.saratoga;
  set improve.saratoga;
  label Size="Living space";
run;

ods listing gpath='/folders/myfolders/improving-your-scatterplots/images/';

ods graphics / imagename="scatter-filled" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    transparency=0
    markerattrs=(
      symbol=CircleFilled 
      size=15
    );
run;

ods graphics / imagename="scatter-open" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    transparency=0
    markerattrs=(
      symbol=Circle 
      size=15
    );
run;

ods graphics / imagename="scatter-small" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    transparency=0
    markerattrs=(
      symbol=CircleFilled 
      size=5
    );
run;

ods graphics / imagename="scatter-opacity" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    transparency=0.9
    markerattrs=(
      symbol=CircleFilled 
      size=15
    );
run;

ods graphics / imagename="scatter-log" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    transparency=0
    markerattrs=(
      symbol=CircleFilled 
      size=15
    );
  xaxis type=log logbase=2 logstyle=logexpand;
  yaxis type=log logbase=2 logstyle=logexpand;
run;

ods graphics / imagename="scatter-combination" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    transparency=0
    markerattrs=(
      symbol=Circle 
      size=5
    );
  xaxis type=log logbase=2 logstyle=logexpand;
  yaxis type=log logbase=2 logstyle=logexpand;
run;

ods graphics / imagename="scatter-no-jitter" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Bedrooms y=Price / 
    transparency=0
    markerattrs=(
      symbol=CircleFilled 
      size=15
    );
run;

ods graphics / imagename="scatter-jitter" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Bedrooms y=Price / 
    jitter
    transparency=0
    markerattrs=(
      symbol=CircleFilled 
      size=15
    );
run;

ods graphics / imagename="scatter-color" imagefmt=png reset=index;
proc sgplot
    data=improve.saratoga;
  scatter x=Size y=Price / 
    colorresponse=Baths
    markerattrs=(
      symbol=CircleFilled 
      size=5
    );
run;
