libname LG "/folders/myfolders/Proactive Attrition Management-Logistic Regression Case Study";
	
proc import datafile="/folders/myfolders/Proactive Attrition Management-Logistic Regression Case Study/Proactive Attrition Management-Logistic Regression Case Study.csv"
out=LG.LG1 dbms=csv replace;
getnames= yes;
run;
	
proc contents data=LG.LG1 varnum;
run;
	
proc means data=LG.LG1 N Nmiss mean std min P1 P5 P10 P25 P50 P75 P90 P95 P99 max;
run;
	
/* OUTLIER TREATMENT_5% and 95% Capping */

DATA LG.LG2;
SET LG.LG1;
	if  REVENUE >  135.39  Then REVENUE =  135.39 ;
	if  MOU >  1580.25  Then MOU =  1580.25 ;
	if  RECCHRGE >  85  Then RECCHRGE =  85 ;
	if  DIRECTAS >  4.21  Then DIRECTAS =  4.21 ;
	if  OVERAGE >  190.375  Then OVERAGE =  190.375 ;
	if  ROAM >  5.09  Then ROAM =  5.09 ;
	if  CHANGEM >  345.25  Then CHANGEM =  345.25 ;
	if  CHANGER >  46.218  Then CHANGER =  46.218 ;
	if  DROPVCE >  22  Then DROPVCE =  22 ;
	if  BLCKVCE >  17.33  Then BLCKVCE =  17.33 ;
	if  UNANSVCE >  97.67  Then UNANSVCE =  97.67 ;
	if  CUSTCARE >  9.33  Then CUSTCARE =  9.33 ;
	if  THREEWAY >  1.33  Then THREEWAY =  1.33 ;
	if  MOUREC >  440.938  Then MOUREC =  440.938 ;
	if  OUTCALLS >  90.33  Then OUTCALLS =  90.33 ;
	if  INCALLS >  35.67  Then INCALLS =  35.67 ;
	if  PEAKVCE >  279.67  Then PEAKVCE =  279.67 ;
	if  OPEAKVCE >  242  Then OPEAKVCE =  242 ;
	if  DROPBLK >  35.33  Then DROPBLK =  35.33 ;
	if  CALLFWDV >  0  Then CALLFWDV =  0 ;
	if  CALLWAIT >  8.67  Then CALLWAIT =  8.67 ;
	if  CHURN >  1  Then CHURN =  1 ;
	if  MONTHS >  37  Then MONTHS =  37 ;
	if  UNIQSUBS >  3  Then UNIQSUBS =  3 ;
	if  ACTVSUBS >  2  Then ACTVSUBS =  2 ;
	if  PHONES >  4  Then PHONES =  4 ;
	if  MODELS >  3  Then MODELS =  3 ;
	if  EQPDAYS >  866  Then EQPDAYS =  866 ;
	if  AGE1 >  62  Then AGE1 =  62 ;
	if  AGE2 >  62  Then AGE2 =  62 ;
	if  RETCALLS >  0  Then RETCALLS =  0 ;
	if  RETACCPT >  0  Then RETACCPT =  0 ;
	if  REFER >  0  Then REFER =  0 ;
	if  INCOME >  9  Then INCOME =  9 ;
	if  CREDITAD >  0  Then CREDITAD =  0 ;
	if  SETPRC >  149.99  Then SETPRC =  149.99 ;
	
	if  REVENUE <  15.51  Then REVENUE =  15.51 ;
	if  MOU <  20.33  Then MOU =  20.33 ;
	if  RECCHRGE <  10  Then RECCHRGE =  10 ;
	if  DIRECTAS <  0  Then DIRECTAS =  0 ;
	if  OVERAGE <  0  Then OVERAGE =  0 ;
	if  ROAM <  0  Then ROAM =  0 ;
	if  CHANGEM <  -376.25  Then CHANGEM =  -376.25 ;
	if  CHANGER <  -47.5  Then CHANGER =  -47.5 ;
	if  DROPVCE <  0  Then DROPVCE =  0 ;
	if  BLCKVCE <  0  Then BLCKVCE =  0 ;
	if  UNANSVCE <  0  Then UNANSVCE =  0 ;
	if  CUSTCARE <  0  Then CUSTCARE =  0 ;
	if  THREEWAY <  0  Then THREEWAY =  0 ;
	if  MOUREC <  0  Then MOUREC =  0 ;
	if  OUTCALLS <  0  Then OUTCALLS =  0 ;
	if  INCALLS <  0  Then INCALLS =  0 ;
	if  PEAKVCE <  0  Then PEAKVCE =  0 ;
	if  OPEAKVCE <  0  Then OPEAKVCE =  0 ;
	if  DROPBLK <  0  Then DROPBLK =  0 ;
	if  CALLFWDV <  0  Then CALLFWDV =  0 ;
	if  CALLWAIT <  0  Then CALLWAIT =  0 ;
	if  CHURN <  0  Then CHURN =  0 ;
	if  MONTHS <  7  Then MONTHS =  7 ;
	if  UNIQSUBS <  1  Then UNIQSUBS =  1 ;
	if  ACTVSUBS <  1  Then ACTVSUBS =  1 ;
	if  PHONES <  1  Then PHONES =  1 ;
	if  MODELS <  1  Then MODELS =  1 ;
	if  EQPDAYS <  42  Then EQPDAYS =  42 ;
	if  AGE1 <  0  Then AGE1 =  0 ;
	if  AGE2 <  0  Then AGE2 =  0 ;
	if  RETCALLS <  0  Then RETCALLS =  0 ;
	if  RETACCPT <  0  Then RETACCPT =  0 ;
	if  REFER <  0  Then REFER =  0 ;
	if  INCOME <  0  Then INCOME =  0 ;
	if  CREDITAD <  0  Then CREDITAD =  0 ;
	if  SETPRC <  0  Then SETPRC =  0 ;
	RUN;
	

/* MISSING VALUE TREATMENT_MEAN IMPUTATION */
	
DATA LG.LG3;
SET LG.LG2;
	IF REVENUE=. THEN REVENUE=58.8539614;
	IF MOU=. THEN MOU=525.7283924;
	IF RECCHRGE=. THEN RECCHRGE=46.8764916;
	IF DIRECTAS=. THEN DIRECTAS=0.8948011;
	IF OVERAGE=. THEN OVERAGE=40.0953598;
	IF ROAM=. THEN ROAM=1.2215262;
	IF CHANGEM=. THEN CHANGEM=-10.8464614;
	IF CHANGER=. THEN CHANGER=-1.2059256;
	IF AGE1=. THEN AGE1=31.37511;
	IF AGE2=. THEN AGE2=21.15772;
	IF PHONES=. THEN PHONES=1.808617;
	IF MODELS=. THEN MODELS=1.561791;
	IF EQPDAYS=. THEN EQPDAYS=380.2656;
	RUN;

PROC FREQ DATA=LG.LG3;
table CHURN;
RUN;
	

/* Selecting important categorical varibales using 'chisquare test' */
	
proc freq data=LG.LG3;
tables CHURN * (CHILDREN
	CREDITA
	CREDITAA
	CREDITB
	CREDITC
	CREDITDE
	CREDITGY
	CREDITZ
	PRIZMRUR
	PRIZMUB
	PRIZMTWN
	REFURB
	WEBCAP
	TRUCK
	RV
	OCCPROF
	OCCCLER
	OCCCRFT
	OCCSTUD
	OCCHMKR
	OCCRET
	OCCSELF
	MARRYYES
	MARRYNO
	MAILORD
	MAILRES
	MAILFLAG
	TRAVEL
	PCOWN
	CREDITCD
	NEWCELLY
	NEWCELLN
	MCYCLE
	INCMISS)/ chisq nocol nopercent norow;
	run;
	
/* Correlation Matrix */
	
proc corr data=LG.LG3;
var REVENUE
	MOU
	RECCHRGE
	DIRECTAS
	OVERAGE
	ROAM
	CHANGEM
	CHANGER
	DROPVCE
	BLCKVCE
	UNANSVCE
	CUSTCARE
	THREEWAY
	MOUREC
	OUTCALLS
	INCALLS
	PEAKVCE
	OPEAKVCE
	DROPBLK
	CALLFWDV
	CALLWAIT
	MONTHS
	UNIQSUBS
	ACTVSUBS
	PHONES
	MODELS
	EQPDAYS
	RETCALLS
	RETACCPT
	INCOME
	CREDITAD
	SETPRCM
	SETPRC;
	run;
		
/* Variable reduction using stepwise regression */
	
proc reg data= LG.LG3;
	model CHURN = REVENUE
	MOU
	RECCHRGE
	DIRECTAS
	OVERAGE
	ROAM
	CHANGEM
	CHANGER
	DROPVCE
	BLCKVCE
	UNANSVCE
	CUSTCARE
	THREEWAY
	MOUREC
	OUTCALLS
	INCALLS
	PEAKVCE
	OPEAKVCE
	CALLFWDV
	DROPBLK
	CALLWAIT
	MONTHS
	UNIQSUBS
	ACTVSUBS
	PHONES
	MODELS
	EQPDAYS
	AGE1
	AGE2
	CREDITA
	CREDITAA
	CREDITB
	CREDITC
	CREDITDE
	PRIZMRUR
	PRIZMUB
	PRIZMTWN
	REFURB
	WEBCAP
	OCCRET
	MARRYNO
	MAILORD
	MAILRES
	CREDITCD
	RETCALLS
    RETACCPT
    NEWCELLY
    REFER
    MCYCLE
    CREDITAD
    SETPRCM
    SETPRC
    INCOME/ selection= stepwise slentry=0.05 slstay=0.1 VIF STB;
	run;
	
/* Development and validation data Splitting */
	
data dev val;
set LG.LG3;
	if  CALIBRAT=1 then output dev;
	else output val;
	run;
	
data LG.LG3;
set LG.LG3;
	root_mou = sqrt(mou);
	root_eqpdays = sqrt(eqpdays);
	root_overage = sqrt(overage);
	run;
	
data val;
set val;
	root_mou = sqrt(mou);
	root_eqpdays = sqrt(eqpdays);
	root_overage = sqrt(overage);
	run;
	
data dev;
set dev;
	root_mou = sqrt(mou);
	root_eqpdays = sqrt(eqpdays);
	root_overage = sqrt(overage);
	run;
	
/* Logistic Regression */
	
proc logistic data=dev descending;
	model CHURN = REVENUE
root_mou 
RECCHRGE
root_overage
ROAM
CHANGEM
CHANGER
DROPVCE
BLCKVCE
CUSTCARE
THREEWAY
INCALLS
PEAKVCE
OPEAKVCE
CALLWAIT
MONTHS
UNIQSUBS
ACTVSUBS
PHONES
root_eqpdays
AGE1
CREDITAA
CREDITB
CREDITC
CREDITDE
PRIZMRUR
PRIZMUB
REFURB
WEBCAP
MARRYNO
MAILRES
CREDITCD
NEWCELLY
SETPRC
/ selection=stepwise slentry=0.05 slstay=0.05 stb lackfit;
	output out = tmp p=newpred;
	run;
	
	
/* Final Iteration */

proc logistic data=dev descending;
model CHURN = root_mou
root_overage
ROAM
CHANGEM
CHANGER
DROPVCE
BLCKVCE
THREEWAY
INCALLS
PEAKVCE
OPEAKVCE
MONTHS
UNIQSUBS
ACTVSUBS
PHONES
root_eqpdays
AGE1
CREDITB
CREDITC
CREDITDE
PRIZMUB
REFURB
WEBCAP
MARRYNO
MAILRES
NEWCELLY
SETPRC/ selection=stepwise stb lackfit;
	output out = tmp p=newpred;
	run;

proc sort data=tmp;
by descending newpred;
run;
	
proc rank data=tmp groups=10 out=dev;
/*by descending prob;*/
var newpred;
ranks probrank;
run;
	
proc sql ;
	select probrank, count(newpred) as number_of_obs, min(newpred) as min_score,
	max(newpred) as max_score,sum(churn) as churners
	from dev
	group by probrank
	order by probrank desc;
	quit;
	
/* Validation deciling */
	
data val;
set val;
	Y= -0.5054 + (root_mou*-0.0243)
	+(root_overage*0.05)
	+(ROAM*0.0431)
	+(CHANGEM*-0.00082)
	+(CHANGER*0.00175)
	+(DROPVCE*0.0165)
	+(BLCKVCE*0.00968)
	+(THREEWAY*-0.1089)
	+(INCALLS*-0.00559)
	+(PEAKVCE*-0.00103)
	+(OPEAKVCE*0.000858)
	+(MONTHS*-0.0184)
	+(UNIQSUBS*0.1921)
	+(ACTVSUBS*-0.1686)
	+(PHONES*0.1188)
	+(root_eqpdays*0.0611)
	+(AGE1*-0.00343)
	+(CREDITB*0.06)
	+(CREDITC*-0.1288)
	+(CREDITDE*-0.3267)
	+(PRIZMUB*-0.0554)
	+(REFURB*0.2448)
	+(WEBCAP*-0.197)
	+(MARRYNO*-0.0485)
	+(MAILRES*-0.1181)
	+(NEWCELLY*-0.0671)
	+(SETPRC*0.00155)
	;
	pred= exp(Y)/1+exp(Y);
	run;
	
proc sort data=val;
by descending pred;
run;
	
proc rank data=val groups=10 out=val1;
/*by descending prob*/
	var pred;
	ranks probrank;
	run;
	
proc sql ;
	select probrank, count(pred) as number_of_obs, min(pred) as min_score,
	max(pred) as max_score,sum(churn) as churners
	from val1
	group by probrank
	order by probrank desc;
	quit;
	
/************************************END*************************************/
