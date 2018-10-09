<img src="cloud.svg" align="right">

# Startarkitektur <br> GovCloud PaaS<br> Statens IT

Dette dokument beskriver en arkitektur for et projekt der har til formål at etablere en fællesoffentlig udviklings- og drifts-platform hos Statens IT. Platformen anvender teknologier kendt fra 'cloud' til at understøtte 'continuous delivery' og 'agile development'.

Projektet er baseret på erfaringer fra DMI, SIT og DIGST, der i sommeren 2018 gennemførte et 'proof of concept' for distribution af meteorologiske observationer og vejrudsigter. Projektet har også til hensigt at etablere en 'best practices' til at understøtte et muligt fællesoffentlig princip om 'cloud first' it-udvikling.


## Målsætninger
Projektets deltagere har følgende overordnede målsætninger (her udtrykt som user stories):

- Som anvender af platformen vil DMI have højest mulig oppetid for mine applikationer.
- Som applikationsudvikler ønsker DMI at kunne teste og idriftsætte nye versioner hurtigst muligt.
- Som udbyder af platformen vil SIT have mulighed for at udskifte produkter i platformen med mindst mulig påvirkning af mine kunder.
- Som udbyder af platformen vil SIT kunne udvide platformen med flere applikationer, uden at platformen koster væsentligt flere ressourcer.
- Som ansvarlig for den fællesoffentlige digitaliseringsstrategi vil DISGT have mere sammenhængende, sikre og effektive it-anvendelser.

## Principper
Ovenstående målsætninger kan generaliseres til principper, der kan styre udviklingen af platformen - også udover udviklingen af de første applikationer:

**Uafbrudte services**: GovCloud platformen og dens applikationer er bygget med henblik på uafbrudt service både under opdatering af enkelte services og hele platformen.

**Leverandøruafhængighed**: Applikationer og data skal effektivt kunne flyttes fra en cloud platform til en anden. Dette sikres gennem anvendelse af standardiserede snitflader der understøttes af open source implementeringer.

**Skalérbar platform**: Forvaltning, support og komponenter skal kunne håndtere mange applikationer med begrænset tilføjelse ressourcer. Dette sikres blandt andet gennem anvendelse enterprise grade komponenter, fokus på automatisering og øget selvbetjening.

**Security-by-design**: Platformen er designet på en måde der sikre applikationer høj informationssikkerhed fx ved kryptering af data ved opbevaring og transport, centraliseret brugerstyring og overvågning af netværkstrafik.

**GDPR-by-design**: Platformen er forberedt til behandling af persondata og andre følsomme data. Indledningsvis adriftes applikationer alene hos SIT (on-premise), men efterhånden som juridiske forhold bliver klartlagt vil udvalgte applikationer kunne afvikles i andre drifsmiljøer (public cloud).

**Omkostningssikker**: Platformens driftsmodel skal sikre, at kunders omkostninger til platformen er forudsigelige.

## Design
Startarkitekturen består af en række designbeslutninger til brug for afgrænsning og konkretisering af projekteter. I forbindelse med den konkrete etablering kan beslutningerne ændres med deltagernes accept.

**[PaaS]** GovCloud platformen udbydes af SIT under 'Driftsmodel 2: Platformservice' med nedenstående tilpasninger (nummereringen henviser til vedlagte kopi af driftsmodel).


**[1. Service Lifecycle]** GovCloud platformens middleware er under kontinuerlig udvikling, der styres af i samarbejde DIGST og SIT i dialog med platformens anvendere.

GovCloud platformens governance bygger videre på SITs eksisterende Driftsmodel 2. Platformen og platformservices udvikles kontinuerligt af SIT. Efterhånden som flere kunder anvender samme platform bliver der brug for et forum til at prioritere og udvælge nye kapabiliteter. For at sikre sammenhæng mellem platformens udvikling og den fællesoffentlige digitaliseringsstratgi bestemmes middleware af SIT og DIGST i fælleskab og efter dialog med platformens kunder.

GovCloud platformens styringsforum vil også være ansvarlig for udarbejdelse og håndhævelse af en 'fair use'-vejledning. Formålet med vejledningen er at sikre en effektiv anvendelsen af platformens samlede ressourcer uden at pålægge den enkelte kunde unødige administrative byrder.

**[2. Service Operation]** Driften og overvågning af GovCloud platformen samt kunders applikationer understøttes af en udvidet vagtordning (24/7).

Applikationer på GovCloud platformen forventes at skulle understøtte virksomheder og borgeres aktiviteter uden for almindelige arbejdstid. For at undgå mangeartede driftsaftaler, er platformen og alle applikationer underlagt samme 24/7 service level agreement.

SIT har ansvar for at overvåge platformen og kundens applikationer. Ved nedbrud af services er det SITs ansvar at drive arbejdet med at bringe applikationer i drift igen. Kunden har ansvar for at stille ressourcer tilrådighed for fejlfinding og eventuelle tilrettelser. Ved valg af middleware-komponenter lægges vægt på adgang til 24/7 professional services. Til at understøtte samarbejde i forbindelse med servicenedbrud etablere SIT samarbejdsværktøj til effektiv kommunikation mellem SIT, kunder, platforms- og applikations-leverandører.


**[3. Middleware]** GovCloud platformens middleware består indledningsvis af: MapR, Docker, Kubernetes og KrakenD. Derudover udvikler SIT platformservices til logning, brugerstyring, authentication og versionstyring af applikationer.

Implementeringen af platformservices og konfiguration af middlewarekomponenterne udføres af SIT efter retningslinjer fra DIGST beskrevet i "Specifikation af GovCloud PaaS middleware'. DIGST sikre hermed at GovCloud PaaS understøtter den Fællesoffentlige Digitale Arkitektur.

**[4. Idriftsættelse]** GovCloud platformen og kunders applikationer vil benytte 'rolling updates'.

SITs standard-idriftsættelsesproces understøtter ikke uafbrudte services eller automatiserede idriftsættelser af applikationer initieret af kunder.

<br>
Udover ovenstående beslutninger vedrørende driften af platformen, er der også besluttet følgende:

**[Toolchain]** SIT tilbyder en samling intergrerede værktøj til applikationsudvikling  på 'Driftsmodel 1: Applikationsservice' bestående indledningsvis af Jira, Confluence, Git, Jenkins, Soap UI.

De fælles værktøj til applikationsudvikling bestemmes i regi af den fællesoffentlige digitaliseringsstratgi, blandt andet med henblik på at projekter effektivt kan udføres med deltagere fra flere parter.

**[DevOps]** DIGST sikrer, at der findes kurser i anvendelse af de valgte værktøjer og tilbyder rådgivning og review af design af applikationer på GovCloud platformen.

**[Sandbox]** SIT tilbyder eksisterende og potentielle kunder et gratis miljø til afprøvning af GovCloud platformen samt tilhørende udviklingsværktøj.

<br>
<div align=right style="font-style: italic;">/madsh@digst.dk, v2.0.0, 20181008</div>
