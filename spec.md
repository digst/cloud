<pre class='metadata'>
Title: cloud.gov.dk spec
Status: LD
URL: http://github.com/digst/cloud/spec.md
Editor: Mads Hjorth, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Abstract: Beskrivelse af implementeringen af GovCloud PaaS.
Boilerplate: copyright no, conformance no, Abstract no
Shortname: spec
Markup Shorthands: markdown yes
Repository: digst/cloud
Inline Github Issues: full
Logo: https://digst.github.io/cloud/cloud.svg
</pre>

<h1>Specifikation <br> GovCloud PaaS <br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>


<h2 class="no-num">Introduction</h2>


!add security specific notes... Multitenancy, Privacy, Resilliance

<img src="PaaSBusiness.svg" width="95%">


## Epics and User Stories
[bør nok flyttes til JIRA issues på et tidspunkt...]

For at fastholde og prioritere forskellige ønsker under udviklingen, anvender vi epics og user stories. I første omgang er aktørerne (Applikations-)udvikler/Anvender, (Platforms)-operatør  og Policy Owner?  Auditor?

Navne i kantede parenteser, henviser til eksterne dokumenter, eller til services/interfaces i figuren længere nede (dem med punktummer).


### Application Development and Operation
Når epic'en er færdig kan en udvikler push'e et docker image til et repository på platformen, re-deploye en applikation, se dens log, samt styre rettigheder til services og datasæt.

* Som anvender ønsker jeg at udbyder kan overvåger mine services og kan forsøge at genstarte applikationer, så jeg ikke behøves at reagere på simple (dem der kan klares ved en genstart) nedbrud.
    * [servicemodel] beskriver udbyders og anvenders ansvar
    * [proces] beskriver at udbyder starter processen og at [collab.] anvedndes i håndteringen af hændelsen.
    * [status.] viser oversigt over anvenders services
    * [status.] viser oversigt over platformens services

* Som anvender ønsker jeg, at udbyderen overvåger mine services og kontakter mig ved ikke-simple nedbrud, så vi sammen kan påbegynde fejlsøgning og fejlretning.
    * [proces] beskriver, hvornår der tages kontakt til anvender
    * [proces] beskriver, hvordan samarbejdet om fejlsøgning og fejlretning foretages samt hvordan det konkluderes, at servicen kører igen
    * [proces] beskriver, hvornår der tages kontakt til 3. part
    * [collab.] opretter automatisk sagerved incidents


* Som anvender ønsker jeg at kunne sende et image til platformen og sætte en label på, så jeg selv nemt kan styre hvilken kode der kører i min applikation.
    * en anvender kan logge ind i [reg.] med sine AD brugernavn/password.
    * labels kan anvendes i [k8s.] til at udpege versioner af images.

* Som anveder ønsker jeg at kunne starte et re-deploy af min applikation ved blot at ændre labels, så jeg hurtigt kan ændrer funktionalitet i min applikation
    * [k8s.] skal genkende ændringer images og reagere på labels ændringer.

* Som anvender ønsker jeg at kunne se loggen fra mine deployments af applikationer, så jeg kan se om det lykkedes

* Som anvender ønsker jeg at kunne se loggen fra mine kørende applikationer, så jeg kan sikre mig at den kører som forventligt eller jeg kan finde ud af hvorfor den ikke gør...

* Som anvender ønsker jeg kunne begrænse adgangen til services til kendte anvendere, så jeg undgår 'unfair' use eller anonyme anvendelse.
    * [directory.] skal kunne opbevare api-nøgler
    * [service.] skal kunne begrænse adgang til services baseret på api-nøgler.
    * anvender kan oprette og slette api-nøgler ved web-service kald.
    * (Vi skal snakkeo om anvendelse af Gravitee)

* Som anvender ønsker jeg at kunne tildele adgang til services, applikationer og data til bruger i egen og andre organisationer (inden for SIT AD), så vi bedre kan arbejde sammen.
    * [directory.] skal kunne opbevare rettigheder


* Som policy owner, ønsker jeg at oplysninger om services, applikationer og dastasæt lever op til krav om registrering, så anvender ikke behøver at registrere oplysninger andre steder.
    * [directory.] skal kunne opbevare alle felter der findes i modellen til beskrivelse af it-systemer.

* Som anvender ønsker jeg kunne se incidents og events i eget overvågningsssystem, så jeg ikke skal kigge andre steder.
    * [status.] events er tilgængelig for Nagios hos anvender
    * [??] incidents er tilgængelig for Nagios hos anvender

* Som udbyder vil jeg gerne begrænse synlighed af statuses og incidents, så der ikke opstår unødig opmærksomhed fra offentligheden.
    * [status.] er ikke tilgængelig for andre end anvendere.




### Platform Service Delivery

Når epic'en er afsluttet er overordnde opgaver og ansvar omkring GovCloud Paas placeret, første møde i nyoprette fora afholdt og første aftale om anvendelse af platformen indgået.

* Som udbyder, anvender og policy owner ønsker vi et fælles samarbejdsorgan, hvor vi kan diskutere problemer og finde løsninger i fællesskab, så vi i samarbejde kan afhjælpe problemer og uklarheder med henblik på videreudvikling af platformen.
    * Der er etableret forum på KC-niveau
    * Der er etableret forum på styrelsesdirektørniveau

* Som anvender af platformen ønsker jeg at kunne påvirke  hvilke service der er tilrådighed, så jeg kan designe mine applikationer med henblik på minimal vedligehold. (sikkerhed for long term support)
    * [brugergruppe] vedligeholder [api] og et [roadmap]

* Anvender og policy owner, ønsker at sikres sig, at applikationer kan flyttes til andre platforme med mindst mulig besvær, så anvendere ikke er bundet til en specifik leverandør.
    * [api] anvender snitflader der kan implementeres på andre platforme.

* Som udbyder ønsker jeg mulighed for at påvirke hvilke service der forventes at være tilrådighed, så jeg kan sikre mig den mest effektive implementering. (frihed til at valg af middleware) [brugergruppe] [start]

* Som udbyder ønsker jeg kendskab til anvenderes behov for kapicitet, så jeg kan planlægger provisioning af hardware, netværk og fysiske lokalitet. (langsigtet planlægning) [servicemodel]
[brugergruppe] [roadmap]

* Som anvender ønsker jeg at platformens ressource udvides i takt med mine behov. ??[servicemodel]

* Som anvender, udbyder og policy owner, ønsker jeg et tydeligt overblik over om aftalte serviceniveauer er overholdt. [brugergruppe] [servicemodel] [servicerapport]

* Som udbyder ønsker jeg at tilbyde platformen på en fælles servicemodel til alle anvendere, så jeg nemmere kan styre hele kundeforholdet. [servicemodel]

* Som anvender ønsker jeg en tydelige beskrivelse af hvilke services og serviceniveauer jeg kan forvente, så jeg bedre kan indgå aftaler med eksterne leverandører og/eller ansætte kompetancer. [servicemodel] [api] [roadmap]

* Som policyowner? ønsker jeg at servicemodellen udbredes til alle eksisterende, med henblik på hurtig ibrugtaging. [kundeaftaler]



### Platform Service Operation
Når epic'en er afsluttet er arbejdsgange for event management beskrevet og understøttet i samarbejdsværktøjet.

* Som udbyder ønsker jeg at anvendere deltager i diagnostik og ændringer i forbindelse med nedbrud på enkelte applikationer, så jeg ikke selv behøver kendskab til anvenderens applikationer, men kan fokusere på platformen.

* Som policy owner ønsker jeg at anvendere kan tage ansvar for fejlfinding og ændringer i deres egen applikationer, så udbyderen ikke bliver en flaskehals for vedligehold.

* Som udbyder og anvender ønsker jeg et fælles netbaseret samarbejdsrum, hvor vi kan diskutere problemer og løsninger i fællesskab, eventuelt inddrage leverandører af middleware, så vi sikre et fælles billede af hændelsesforløb til brug for problem management og raportering af serviceniveauer.


### Platform and Support
Når epic'en er færdig kan en anvender deploye services, applikationer og datasæt igennem selvbetjening.

* Som anvender ønsker jeg at kunne afvikle min applikationer på en veldefineret runtime.
    * [api] beskriver runtime (K8S and Docker) og snitflader til platform services.
    * [reg] er beskrevet.
    * (Git og GitLabRunner er en del af toolchain?)

* Som anvender ønsker at anvende en NoSQL datastore
    * applikationer kan læse og skrive JSON dokumenter på port 8243 på [data.]

* Som anvender ønsker jeg at produce og consume beskeder fra min applikation, så jeg kan anvende løskoblet meddelsesbaseret integration mellem mine applikationskomponenter.
    * applikationer kan læse og skrive meddelelser via Kafka på port 8082 på [data.]

* Som anvender ønsker jeg skrive og læse binære filer fra min applikation, så jeg selv kan deploye andre dataservices som fx SQL.
    * applikationer kan læse og skrive vilkårlige filer via NFS på port 2049 på [data.]

* Som anvender ønsker jeg at kunne anvende dataservies fra platformen direkte fra eget netværk (well.... det bliver så nok igennem deres egen proxy-applikation og services. Er det noget udbyder til tilbyde?)

* Som anvender ønsker jeg en en token service....


### Performance og Optimering

* Som udvikler og udbyder vil jeg kende applikations performance profil på platform, og kunne se hvor tiden bliver brugt, så bruger ressourcer fair og effektivt.


### Sharing, Sikring og Privacy

* Som anvender ønsker jeg at udbyder scanner mine applikationer for sårbarheder.

* Som anvender ønsker jeg at kunne give adgang til data for andre anvenderes applikationer, så jeg kan dele data uden at skulle udvikle en service. [Sikkerheds epic?]

* Sikkerhedsmodel

### Compliance

* Overblik over ISO 27001 kontrollere

* Overblik over GDPR aftaler, rettigheder og pligter

* Som policy owner... ekstern IdP, så vi sikre overholdelse af anbefalinger.

* Som policy owner... om selvbetjening? og datadeling?

* Digital Asset management

* Dokumentation af applikationer


### Audit / Erfaring
* Tilsyn...
* Security Audit
* Privacy Audit
* Performance Audit

### PaaS+
Når epic'en er færdig kan en udvikler deploy en service der er begrænset til anvender med aktive API nøgler samt selv oprette og (de)-aktivere API nøgler.

* Som udvikler vil jeg kunne angive i mit deployment hvilke services der kræver en gyldig API nøgle. (Rancher, *API Gateway*)

* Som udvikler vil jeg kunne kalde en service der opretter, aktivere og deaktivere API nøgler på platformen. (*Directory*)


### Sandbox
Når epic'en er færdig kan en SIT kunde oprette en midlertidig bruger til sin udvikler, som kan anvende MapR fra sine udvikler pc.

* Som udvikler vil jeg kunne bestille en virtual maskine hos SIT der kører den samlede Cloud API, så jeg kan afprøve teknologierne. (OpenStack)

* Som udvikler vil jeg kunne hente en virtual maskine hos SIT der kører den samlede Cloud API og afvikle den på min egen bærbare. (OpenStack)

(kombinere med udbyders behov for pre-prod?)


## Versions and plans

### Version 1.0 medio 2019

* Learning

* Stable

Focus på Deploy og Monitorering så vi kan demonstrere time to market og hyppige ændringer...

Focus på Dataservices

Produktionssættelse af DMI Observationsdata

### Version 1.1
Performant

### Version 1.2
Focus på intern sikkerhed med tickets og tokens.

### Version 1.3
compliance


### Version 2
Brokering



# Highlevel

## Aktører og use cases

### Anvender

### Udbyder

### Policy Owner

### Platform Delivery

### Application DevOps

### Platform Operation

### Audit

## Principles

Continuous Services, Vendor neutrality, High Scaleability, Security-by-design, GDPR-by-design, DevOps and Predictable Cost.


## Governing Thoughts....

Architectural consequences:

**Enterprise Grade Products**, to support high scaleability with predictable cost.

**Open Source supported interfaces**, to support  vendor neutrality and predictable cost.

**Self-Service (and automation)**, to support Continous Services, High Scaleability and DevOps.

Layered architecture (each layer scale idependently and different governance processes for: Data, Application and Access)

One platform? (staging on the same platform, run on dev laptop, integrated automated test, multiple versions of same service, active-active)

## High Level Architecture


<dfn>App Fabric</dfn> is...

<dfn>Data Fabric</dfn> is...

<img src="highlevel.svg">

And supporting services.... some for developers and some for applications.

Pure Archimate ... vi har valgt at sætte lighedstegn mellem platform of technology og lade kunders applikationer være blå. Det gør det muligt at synliggøre ansvarsfordelingen mellem platform og applikations som beskrevet i driftsmodellen (PaaS).



# Arbejdsgange/Brugerrejser
Vi har identificerewt en række arbejdsgange. Her beskrives de i Archimate notation og vi forklarer hvordan de anvender de forskellige komponenter overfor. Under etableringen af platformen er arbejdsgange blevet væsentlig simplere og en lang række skridt er blevet fundet overflødige.


## Registrer ny applikation

<img src="reg_app.svg">


## Deploy applikation (Ops)

<img src="deploy.svg">


## Byg container (Dev)

## Test applikation
(Hvorfor er der ikke noget testmiljø? Fordi kunden selv etablere forskellige applikationer, der kan anvende samme containere og datasæt til forskellige formål)

## Give medarbejder adgang til platformsapplikationer
(eksisterende arbejdsgang. tilknytte B/X nummer til gruppe i AD)

## Register Application
Rancher installation. K8S ressources. Bør formentlig flyttes til en SIT branded selvbetjeningsløsning med få felter... som danner en passende yaml fil, som opbevares i Directory.

## Register Dataset
Oprettes manuelt på MapR. Bør formentlig flyttes til en SIT branded selvbetjeningsløsning med få felter... Fællesoffentlige DCAT/ADMS profil, som opbevares i Directory (og kan udstilles i Datasætkatalog)


## Register Service
Rancher installation. K8S ressources. Bør formentlig flyttes til en SIT branded selvbetjeningsløsning med få felter... som danner en passende servicebeskrivelse, som opbevares i Directory.

Udviklere kan registrere services på platformen. En service er en ressource på access fabric og er en forbindelse mellem et endpoint synligt udefra og et endpoint udstillet af en application på kubernetes.

## Redeploy Application
Rancher Installation. Bør formentlig være en simple knap på Dashboardet.

## Sandbox

SIT provides limited unsupported free-of-charge GovCloud ressources to existing and prospect consumers for evaluation purposes.

Whitelist af mail domæner, re-activation efter 14 dage på samme mail... eller anden (medarbejderen stopper, udvikleren fortsætter).

Implementeres som et 'one-node' image af CloudAPI der kan spindes op ved hjælp af OpenStack eller hentes hjem til lokalt kunde miljø.

Bør kunne laves med tilpasning af Ansible scripts der anvendes til installation af platformen.

## Collaboration
SIT provides collaborative tools to support collaboration during normal operation and during incident handling.



# Platform



## Application and Service Fabric
Responsibilities:

- Oversæt ID og tildel requestID
- Adgangspolitik (Bruger/Service -> Service)
- Throttle/circuit breaker
- Log (AccessLog/Request Log?)

Responsibilities:
- Deploy, scale, redeploy images from Repository
- Provide Configuration Environment
- Ingress/Service Discovery
- Network (...?)
- Mount NFS as Volume (for app log?)


### Service Access Control

### Application Service

### Application

### Container/Image



### Docker/K8S

[Rancher](https://rancher.com/) has been choosen as Kubernetes Cluster Management, for the following reasons: Multitenancy build in, API access suitable for building SIT branded self-service, possible to resuse existing user interface elementes, multi-cluster capabilities, plans provding simple OS and ease of use for platform operation.

The mapping from business objects to Rancher elements are:

- Each SIT Customer is given one Rancher Project.

- Each Customer Application is given one Kubernetes Namespace in Rancher

- Each Customer (Application) Service is a Rancher Load Balancing Workload (Ingress)

and identities are stored in the Directory service.

K8S Service Network Tildeles pods automatisk...

Ingress controller bruger adresserne til loadbalancing mellem instanser.
<pre>
kube-pods-subnet : XXX.XXX.XXX.XXX
</pre>

Environment variablesApps finder datasservices via  environment variable

Note: Hvad peger de (table, stream, file?) på? Ip-adresser, DNS, virtuelle adresser?


<pre highlight="docker">
FROM docker:centos7

http://package.mapr.com/releases/v6.1.0/redhat/mapr-client-6.1.0.20180926230239.GA-1.x86_64.rpm

rpm -Uvh http://repo.krakend.io/rpm/krakend-repo-0.1-0.noarch.rpm


</pre>

Note: Missing HTTPS.... så vi skal nok hente lokalt og checksumme ... eller snakke med MapR om https :-)

### Gravitee



## Data Fabric

Responsible for:
- Store datasets
- Authenticate access to inividual dataset per user/application/service
- Protect datasets against hardware failure at disk, machine and location level.
- Log of all dataoperations
- Implement dataaccess interfaces: File (NFS), Stream (Kafka), Document (OJAI), Table?


The data fabric is running latest version of [MapR](https://mapr.com/).

### Data Access Control

### Datasets

A dataset is a collection of individual pieces of information under the same governance. (pending definition/translation)

- Each customer has its own MapR Volume and is Data Responsible (Controller)i for all data stored.
- Each Dataset are stored in seperate sub-volumes and can have multiple representations (file, table, stream).
- Datasets are given an identity in the central Directory (mapping Dxxxxx to MapR path, storing access rights and ADMS metadata).
- Access to MapR volumes are given to [Application]s and [User]s in the central Directory. (Or should it really be Images?)
- Datasets are encrypted at rest (what keys? control?)

(Er det mulig at bruge symlinks til at referere til datasæts via både FORM, CVR )

### Logs

- All operations on datasets are logged into one datalog stream (Log4J specification needed!), and later split on a per customer base.

### `/nfs` (NFS)

### `/ojai` (NoSQL)

### `/msg` (Kafka)

### `/log`

### MapR

- Linux
- Hardware


- Initially MapR uses one Topology (clusters of identical hardware, identical OS)
- Update zones, Connectivity Zones??
- One cluser across multiple location.
- The `mapr` user should not use default name, UID and GUID.
- Run as non-root?
- Access to the MapR Control System is done through a Linux PAM connected to the central Directory using regular administrative SIT user accounts. (OpenLDAP?)
- Load Balancing using MapR Gateways? (L7, L3-4?, Locations?, Common endpoints across locations)


Note: Dual 10Gb NIC with trunking has been suggested. Would give more bandwidth, but also allow for moving without loosing network connection...













# Platform Support

(Split into services to humans and to applications)
Note: Link til online API beskrivelse af alle services med adresser, porte og protokoller. Husk alt hvad der kan gøres i portal også skal kunne gøres via API.

## Self Service Portal


### Selvbetjening

### `k8s.govcloud.dk`

### Rancher

### `cloud.gov.dk`



## Operation

### Monitorering

### Events

### `status.govcloud.dk`

### `kunde.status.govcloud.dk`

### Collaboration

### collab url?

## Directory
Product with OpenLDAP interface. Data opbevares uden for MapR, men findes i kopi på MapR. Oplysninger om Kunder og Bruger hentes fra SIT AD.

Derudover gemmes identiteter og oplysninger om Applikationer, Services, Datasæt (D-numre) og rettigheder imellem disse og Kunder og Brugere.

Rettigheder anvendes af MapR og af Access Fabric.

Oplysninger om henholdvis services, applikationer og datasæt modelleres efter de fælles offentlige modeller herfor (se data.gov.dk).

Overvej ikke at gøre for mange felter obligatoriske fra starten. Lad kunne vedligeholde oplysninger gennem selvbetjening og uden om (ex excel). Custom felter? Henvisninger til stereotyper fra Referencearkitekturer.

### Users
!Authentication Findes ikke på platformen men sker hos IdP. Federation til Directory. Fx... binde NemId sammen med B-numre.

### Services, Apps (Deployments) og Datasets
- [Application]s are given an identity in the central Directory (Axxxxx, storing ownership, access rights and "Systembeskrivelser").

### Rights



- Each Application exposes Application Services through the use of LoadBalancers.
- Application Services are given an identity in the central Directory (mapping Sxxxxx to Applications, storing access rights and metadata).
- (consequence that all application services have access to same datasets?)

### `/token`

### `/ldap`

### Single Sign On url?

### FreeIPA

### KeyCloak



## Repository

### Application Code

### `git.govcloud.dk`

### GitLab

GitLab installation. Bør kører som applikation i K8S med AD integration og opbevare code som datasæt på MapR. Kræver vist in SQL database som skal installeres sammen med. Helm?



### Docker Images

### `reg.govcloud.dk`

### Habour
Harbor installation. Bør kører som applikation i K8S med AD integration og opbevare containere som datasæt på MapR.









# Infrastructure
Vi beskriver netværket som det ser ud når man ankommer fra internettet....

Vi skal understøtte rolling updates og location failures samtidigt. Eventuelt tegning af L1/L2 og update gruppe A/B. Pointen er at der skal være nok maskiner med nok services i alle fire grupper til at kunne køre selvstændigt.



## Internet Network Access
GovCloud tilgås via kundens egen DNS record, der peger på ét fælles SIT kontrollet domæne, der peger på ét fast IP nummer hos Statens IT.

<pre>
cloud.gov.dk.		3589	IN	A	188.64.157.76
</pre>

Kunder sætter selv DNS CNAME op. Bør være til cloud.gov.dk og ikke ip

<pre>
api.kunde.example.com.		3589	IN	CNAME	cloud.gov.dk
</pre>

Note: kunden kan ikke bruge samme domæne til mail o.a. jf. RFC

Note: Er der trust-relaterede opsætninger i DNS der skal udføres? dnssec? dmarc?

Note: Hvor skal kunden registrere sine servicenavne? Skal vi anbefale SIT?

Note: Overveje hvordan det fælles certifikat kan genbruges til kundedomæner. (https/hostname).



## Gateway

Vi regner med der er Intrusion Protection Service mellem internettet og platformen.

Note: Vi vælger at F5 da vi ikke ønsker at scripte oprettelse af kundedomæner til den. Og da vi ikke ønsker den er ingress controller og indgang til alle øvrige services.

Note: How do we repport usage? Metering: Undersøg om der findes eksisterende overvågning. Vi kan 'nøjes' med per hostname.

Note: Monitoriering. Snak om ping/trace og kalde ned i stakken.

## Network Layout

<img src="network.svg">


### Application Network
Det primære netværk til App fabric dvs. K8S og den ingress controllers, men også loadbalancer ned mod MapR gateways.

Netværket er `vlanXX, 10.aaa.xxx.0/24`

men er yderligere delt op i en række subnet der anvendes til forskellige funktioner, og dermed også kan anvendes til afgrænsninger af trafik i firewallen.

* `10.aaa.xxx.0/28` noder der fungere som gateway og loadbalancer. I starten som manulet opsatte, men kan på sigt være ingress nodes der kontrolleres af K8S.

* `10.aaa.xxx.16/??` de primære applikationsnoder hvor pods afvikles af K8S.

* `10.aaa.xxx.248/29` noder der fungere som loadbalancer ned mod datafabric.



### Data Network
Det primære netværk til Data Fabric dvs hvor MapR kører.

Netværket er `vlanXX, 10.bbb.yyy.0/23`

Alle maskiner har et netværkskort på to subnet, så vi kan skille internt MapR chatter fra adgang til data.

* `10.bbb.yyy.0/24` noder der kører MapR's dataservices: Kafka, OJAI og NFS.

* `10.bbb.zzz.0/24` alle MapR noder.


### Firewall
For at kontrollere trafikken mellem internettet og de to netværk, samt mellem de foskellige funktioner, anvendes følgende firewall regler.


1. Tillad forbindelse fra internettet til gateway for http og https, så applikationer kan anvendes af kunder, borger og virksomheder `188.64.157.76:80,443 -> 10.aaa.xxx.3`

2. Tillad forbindelse fra loadbalancer noder til nfs, ojai og kafka på MapR, så applikationer kan hente og skrive data
`10.aaa.xxx.248/29:2049,8243,5678,8083,8082 -> 10.bbb.yyy.0/24`

3. Tillad forbindelse fra applikationer til internettet, så kunders applikationer kan anvendes services på internettet.
`10.aaa.xxx.16/?? -> any`

4. Tillad forbindelse fra MapR til enkelte applikationsnoder, der kører en proxy, så der kan hentes opdateringer og måske noget med at tjekke licenser. `10.bbb.zzz.0/24 -> 10.aaa.xxx.16/??`



### Remote admin access
Beskytte med certifikater...

admin på app cluster og admin på data cluster er to roller med hver deres certifikater.

Eksterne professionel services skal anvende remote desktop med overvågning fra SIT medarbejder.

## Hardware

# Customer Applications and their responsibilities
- Applications are responsible for implementing access policies to data at row level
- Access policies should rely on trusted attributes over detailes rights when possible.


<h2 class="no-num">Appendix</h2>

## Inspiration

### Kundens It-miljø

Kunden er en offentlig myndighed - som mange andre - med et mangeartet it-system-landskab fordelt på mange teknologi hos mange leverandører.



DevOps og Cloud teknologi

Fælles platform...

Arkitekturstil...

Realiseret... og selvbetjening.

24/7 Platform support. Applikationssupport...


### Tekniske kompetancer

* Udvikling af container baserede applikationer fx Docker.
* Anvendelse af asynkrone meddelelser som integration mellem applikationskomponenter fx Apace Kafka.
* Anvendelse af NoSQL dokumentdatabaser fx OJAI.
* Udvikling af HTTP services der følger REST.
* Token baseret adgangskontrol fx JWT.


## Use of Archimate
