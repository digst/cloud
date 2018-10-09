<img src="cloud.svg" align="right">

# Startarkitektur <br> GovCloud PaaS<br> Statens IT

Dette dokument beskriver arkitekturen for en cloud-baseret fælles udviklings- og drifts-platform hos Statens IT til brug for statslige institutioner. Platformen anvender teknologier kendt fra 'cloud' til at understøtte 'continuous delivery' og 'agile development'.

Projektet er baseret på erfaringer fra DMI, SIT og DIGST, der i sommeren 2018 gennemførte et 'proof of concept' for distribution af meteorologiske observationer og vejrudsigter. DMI og DIGST er de første anvendere af platformen. 

Projektet har  til hensigt at bidrage til en 'best practices' til understøttelse af et muligt fremtidigt princip om 'cloud first' it-udvikling i den offentlige sektor baseret på anvendelse af en række forskellige cloud-løsninger indenfor en fælles ramme vedr. databeskyttelse, datadeling, sikkerhed samt effektivt indkøb og administration.


## Målsætninger
Projektets deltagere har følgende overordnede målsætninger (her udtrykt som user stories):

- Som anvender af platformen vil DMI have højest mulig oppetid for mine applikationer.
- Som applikationsudvikler ønsker DMI at kunne teste og idriftsætte nye versioner hurtigst muligt.
- Som udbyder af platformen vil SIT have mulighed for at udskifte produkter i platformen med mindst mulig påvirkning af mine kunder.
- Som udbyder af platformen vil SIT kunne udvide platformen med flere applikationer, uden at platformen koster væsentligt flere ressourcer.
- Som ansvarlig for den fællesoffentlige digitaliseringsstrategi vil DISGT have mere sammenhængende, sikre og effektive it-anvendelser.

## Principper
Ovenstående målsætninger generaliseres til principper, der anvendes til at styre udviklingen af platformen på kort og lang sigt:

**Uafbrudte services**: GovCloud platformen og dens applikationer er bygget med henblik på uafbrudt service både under opdatering af enkelte services og hele platformen.

**Leverandøruafhængighed**: Applikationer og data på GovCloud platformen skal effektivt kunne flyttes til en anden cloud platform. Dette sikres gennem anvendelse af standardiserede snitflader, der understøttes af open source implementeringer.

**Skalérbar platform**: Forvaltning, support og komponenter skal kunne håndtere mange applikationer med begrænset tilføjelse af ressourcer. Dette sikres blandt andet gennem anvendelse af enterprise grade komponenter, fokus på automatisering og selvbetjening for platformens anvendere.

**Security-by-design**: Platformen er designet på en måde der sikre applikationer høj informationssikkerhed bl.a. ved kryptering af data, integreret brugerstyring og overvågning af netværkstrafik.

**GDPR-by-design**: Platformen er forberedt til behandling af persondata og andre følsomme data i hht. GDPR. Indledningsvis driftes applikationer og data alene hos og af SIT (on-premise), men senere kan udvalgte applikationer og data også driftes i eksterne drifsmiljøer (public clouds).

**Omkostningssikker**: Platformens driftsmodel skal sikre, at kunders omkostninger til platform-services er forudsigelige.

## Design
Startarkitekturen består af en række designbeslutninger til brug for afgrænsning og konkretisering af projektet. I forbindelse med den konkrete etablering kan beslutningerne ændres med deltagernes accept.

**[PaaS]** GovCloud platformen udbydes af SIT under 'Driftsmodel 2: Platformservice' med nedenstående tilpasninger (nummereringen henviser til vedlagte kopi af driftsmodel).


**[1. Service Lifecycle]** GovCloud platformens middleware er under kontinuerlig udvikling og fastlægges af SIT og DIGST i dialog med platformens anvendere.

GovCloud platformens governance bygger videre på SITs eksisterende Driftsmodel 2. Platformen og platformservices udvikles kontinuerligt af SIT. Efterhånden som flere kunder anvender samme platform etableres et forum til at prioritere og udvælge nye kapabiliteter. For at sikre sammenhæng mellem platformens udvikling og den offentlige digitaliseringsstrategi aftales platformens middleware af SIT og DIGST i fælleskab og efter dialog med platformens kunder.

Operativsystem, Server/Storage, Netværk og Fysisk lokation fastlægges af SIT under hensyn til anvendernes behov og økonomi.

SIT og DIGST i dialog med platformens anvendere er ansvarlig for udarbejdelse af en 'fair use'-vejledning. Formålet med vejledningen er at sikre en effektiv anvendelsen af platformens samlede ressourcer uden at pålægge den enkelte kunde unødige administrative byrder.

**[2. Service Operation]** Drift og overvågning af GovCloud platformen samt kunders applikationer understøttes af en udvidet vagtordning hos SIT (24/7).

Applikationer på GovCloud platformen forventes at skulle understøtte virksomheder og borgeres aktiviteter uden for almindelige arbejdstid. For at undgå mangeartede driftsaftaler, er platformen og alle applikationer underlagt samme 24/7 service level agreement.

SIT har ansvar for at overvåge platformen og kundens applikationer. Ved nedbrud af services er det SITs ansvar at drive arbejdet med at bringe applikationer i drift igen. Kunden har ansvar for at stille ressourcer tilrådighed for fejlfinding og eventuelle tilrettelser. Ved valg af middleware-komponenter lægges vægt på adgang til 24/7 professional services. Til at understøtte samarbejde i forbindelse med servicenedbrud etablerer SIT et samarbejdsværktøj til effektiv kommunikation mellem SIT, kunder, platforms- og applikations-leverandører.

**[3. Middleware]** GovCloud platformens middleware består indledningsvis af: MapR, Docker, Kubernetes og KrakenD. Derudover udvikler SIT platformservices til logning, brugerstyring, authentication og versionstyring af applikationer.

Implementeringen af platformservices og konfiguration af middlewarekomponenterne udføres af SIT efter retningslinjer aftalt med DIGST og beskrevet i "Specifikation af GovCloud PaaS middleware'. DIGST har til opgave at sikre, at specifikationen af GovCloud PaaS understøtter den Fællesoffentlige Digitale Arkitektur og fællesstatslige retningslinjer for bl.a. persondatabekyttelse og sikkerhed.

**[4. Idriftsættelse]** GovCloud platformen og kunders applikationer vil benytte 'rolling updates'.

SITs standard-idriftsættelsesproces understøtter ikke uafbrudte services eller automatiserede idriftsættelser af applikationer initieret af kunder. Derfor etablerer SIT en ny idriftsættelseproces, der understøtter cloud og DevOps (?).

<br>
Udover ovenstående beslutninger vedrørende driften af platformen, er der også besluttet følgende:

**[DevOps]** SIT tilbyder en samling integrerede værktøjer til applikationsudvikling  på 'Driftsmodel 1: Applikationsservice' bestående indledningsvis af Jira, Confluence, Git, Jenkins, Soap UI. DIGST sikrer, at der tilgængelige kurser i anvendelse af de valgte værktøjer og tilbyder rådgivning om design af applikationer på GovCloud platformen.

DIGST vil i samarbejde med SIT arbejde for, at fastlæggelsen af samlingen af værktøjer til applikationsudvikling sker i regi af den fællesoffentlige digitaliseringsstrategi eller fællesstatsligt.

**[Sandbox]** SIT tilbyder eksisterende og potentielle kunder et gratis miljø til afprøvning af GovCloud platformen samt tilhørende udviklingsværktøj.

<br>
<div align=right style="font-style: italic;">/madsh@digst.dk, v2.0.0, 20181009</div>
o
