<pre class='metadata'>
Title: cloud.gov.dk start-arkitektur
Date: 2018-10-29
Shortname: start
Status: LD
Group: govcloud
URL: http://github.com/digst/cloud/start.md
Editor: madsh@digst.dk, Digitaliseringsstyrelsen http://digst.dk
Boilerplate: table-of-contents no, copyright no, conformance no, abstract no, index no, idl-index no
No Abstract: true
</pre>



<h1>Start-arkitektur <br> GovCloud PaaS <br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>



<i>I slutningen af oktober 2018 besluttede DMI, SIT og DIGST bl.a. at "Statens IT etablerer en GovCloud-platform baseret på afprøvningsprojektet, således at GovCloud-platformen er klar til service- og applikationsudvikling senest 1. januar 2019 og er klar til drift af applikationer senest 1. juli 2019." Som en del af beslutningsgrundlaget indgik nedenstående beskrivelse af en start-arkitektur for projektet.</i>

Dette dokument beskriver arkitekturen for en cloud-baseret fælles udviklings- og driftsplatform hos Statens IT til brug for statslige institutioner.

Projektet er baseret på erfaringer fra DMI, SIT og DIGST, der i sommeren 2018 gennemførte et 'proof of concept' for distribution af frie DMI-data og applikationsudvikling. DMI og DIGST er de første anvendere af GovCloud-platformen.

Projektet skal bidrage til øget anvendelse af cloud-teknologier i den offentlige sektor baseret på anvendelse af flere forskellige cloud-løsninger indenfor en fælles ramme vedr. databeskyttelse, datadeling, sikkerhed samt effektivt indkøb og administration.


## Forretningsbehov

GovCloud Paas skal bl.a. understøtte følgende forretningsbehov:

- Anvendere vil have højest mulig oppetid for sine applikationer.
- Anvendere vil have en fleksibel og økonomisk adgang til it-ressourcer.
- Anvendere vil kunne teste og idriftsætte nye versioner hurtigst muligt.
- Anvendere ønsker at fokusere på den forretningsnære del af it-udviklingen
- Platformen skal kunne udskifte produkter med mindst mulig påvirkning af kunderne.
- Platformen skal kunne udvides med flere applikationer, uden at udgifter til platformen stiger tilsvarende.
- Udvikling af offentlig IT skal ske økonomisk, hurtigt, agilt og sikkert

## Principper

Ovenstående behov omsættes til følgende principper, der anvendes til at styre GovCloud platformen på kort og lang sigt:

<dfn>Uafbrudte services</dfn> GovCloud platformen og dens applikationer er bygget med henblik på uafbrudt service både under opdatering af enkelte services og hele platformen.

<dfn>Leverandøruafhængighed</dfn> Applikationer og data på GovCloud platformen skal effektivt kunne flyttes til en anden cloud platform. Dette sikres gennem anvendelse af standardiserede snitflader, der understøttes af open source implementeringer.

<dfn>Skalérbar platform</dfn> Forvaltning, support og komponenter skal kunne håndtere mange applikationer med begrænset tilføjelse af ressourcer. Dette sikres blandt andet gennem anvendelse af enterprise grade komponenter, fokus på automatisering og selvbetjening for platformens anvendere.

<dfn>Security-by-design</dfn> Platformen er designet på en måde der sikrer høj informationssikkerhed for applikationer og data, bl.a. ved kryptering af data, integreret brugerstyring og overvågning af netværkstrafik.

<dfn>GDPR-by-design</dfn> Platformen er forberedt til behandling af persondata og andre følsomme data i hht. GDPR. Indledningsvis driftes applikationer og data alene hos og af SIT (on-premise), men senere kan udvalgte applikationer og data også driftes i eksterne drifsmiljøer (scale-out til public clouds).

<dfn>Omkostningssikker</dfn> Platformens driftsmodel sikrer, at kunders omkostninger til platform-services er forudsigelige.

<dfn>Agil it-udvikling</dfn> Platformen og dens driftsmodel skal understøtte applikationsudvikling baseret på DevOps og Continuous Delivery.

## Design
Principperne understøttes af en række designbeslutninger der udgør projektets startarkitektur. I etableringsfasen kan beslutningerne ændres med deltagernes accept.

### PaaS
GovCloud platformen udbydes af SIT under 'Driftsmodel 2: Platformservice' med nedenstående tilpasninger (nummereringen henviser til [vedlagte kopi af driftsmodel](driftsmodel2.pdf)).

### Service Lifecycle (1)
GovCloud platformens middleware udvikles i henhold til anvendernes behov og fastlægges af SIT og DIGST i dialog med platformens anvendere.

Operativsystem, Server/Storage, Netværk og Fysisk lokation fastlægges af SIT under hensyn til anvendernes behov og økonomi.

SIT og DIGST i dialog med platformens anvendere er ansvarlig for udarbejdelse af retningslinjer for 'fair use'. Formålet med retningslinjerne er at sikre en effektiv anvendelsen af platformens samlede ressourcer uden at pålægge den enkelte kunde unødige administrative byrder.

### Service Operation (2)
Drift og overvågning af GovCloud platformen og kunders applikationer understøttes af en udvidet vagtordning hos SIT (24/7).

Applikationer på GovCloud platformen forventes at skulle understøtte virksomheder og borgeres aktiviteter uden for almindelige arbejdstid. For at undgå mangeartede driftsaftaler, er platformen og alle applikationer underlagt samme 24/7 service level agreement.

SIT har ansvar for at overvåge platformen og kundernes applikationer. Ved nedbrud af services er det SITs ansvar at drive arbejdet med at bringe applikationer i drift igen. Kunden har ansvar for at stille ressourcer tilrådighed for fejlfinding og eventuelle tilrettelser. Ved valg af middleware-komponenter lægges vægt på adgang til 24/7 professional services. Til at understøtte samarbejde i forbindelse med servicenedbrud etablerer SIT et samarbejdsværktøj til effektiv kommunikation mellem SIT, kunder, platforms- og applikations-leverandører.

### Middleware (3)
GovCloud platformens middleware består indledningsvis af: Docker, Kubernetes, KrakenD og MapR. Derudover etablerer SIT platformservices til logning, brugerstyring, authentication og versionstyring af applikationer.

Implementeringen af platformservices og konfiguration af middlewarekomponenterne udføres af SIT efter retningslinjer aftalt med DIGST og beskrevet i "[Specifikation af GovCloud PaaS middleware](spec.html)". DIGST har til opgave at sikre, at specifikationen af GovCloud PaaS understøtter den Fællesoffentlige Digitale Arkitektur og fællesstatslige retningslinjer for bl.a. persondatabekyttelse og sikkerhed.

### Idriftsættelse (4)
GovCloud platformen og kunders applikationer vil benytte 'rolling updates'.

SITs etablerer en ny idriftsættelseproces, der understøtter agil applikationsudvikling og hyppig idriftsættelse.

<br>
Udover ovenstående beslutninger vedrørende driften af platformen, er der også besluttet følgende:

### GovDev
SIT tilbyder en samling integrerede værktøjer til applikationsudvikling ("DevOps-toolchain")  på 'Driftsmodel 1: Applikationsservice' bestående indledningsvis af Jira, Confluence, Git, Jenkins, Soap UI. DIGST sikrer, at der tilgængelige kurser i anvendelse af de valgte værktøjer og tilbyder rådgivning om design af applikationer på GovCloud platformen.

DIGST vil sammen med SIT arbejde for, at fastlæggelsen af samlingen af værktøjer til applikationsudvikling sker i regi af den fællesoffentlige digitaliseringsstrategi eller fællesstatsligt.

### Sandbox
SIT tilbyder eksisterende og potentielle kunder et gratis miljø til afprøvning af GovCloud platformen samt tilhørende udviklingsværktøj.

<div align="right" class="font-style: italic; ">/DIGST 2018-4947</div>
