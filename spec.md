<pre class='metadata'>
Title: cloud.gov.dk spec
Status: LD
URL: http://github.com/digst/cloud/spec.md
Editor: Mads Hjorth, Digitaliseringsstyrelsen http://arkitektur.digst.dk
  Jan Nørgaard Jacobsen, Statens IT http://www.sit.dk
  Chris Gadegaard, Statens IT http://www.sit.dk
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


## User Stories
[bør nok flyttes til JIRA issues på et tidspunkt...]
For at fastholde og prioritere forskellige ønsker under udviklingen, anvender vi epics og user stories. I første omgang er aktørerne (Applikations-)udvikler, (Platforms)-operatør  og Policy Owner?

### Epics til understøttelse af "mennesker"

#### Kravspecifikation?
Når epic'en er færdig kan en kunde og en udvikler samarbejde om udarbejdelsen af epics, user stories, start arkitektur og andet i værktøj der kører på platformen. (Jira, Confluence)

#### Byg?
Når epic'en er færdig kan en udvikler checke kode ind og bygge en container med brug af værktøj på platformen. (git, docker)

* Som operatør vil jeg gerne kunne udgive et base image til brug for udviklere

#### Test?
Når epic'en er færdig kan en udvikler eller en operatør teste en containers funktionalitet med en række automatiske testcases.

#### Deploy og Monitorering?
Når epic'en er færdig kan en udvikler push'e en container til et repository på platformen, re-deploye en applikation og se dens log.

* Som udvikler ønsker jeg at kunne skrive 'docker push user/container' i en terminal for at sende min container til platformen. (labeling?) så jeg selv nemt kan styre hvilken kode der kører i min applikation.

* Som udvikler ønsker jeg at kunne starte et re-deploy af min applikation med specifikke version af containere (vha labeling), så jeg hurtigt kan ændrer funktionalitet i min applikation

* Som udvikler ønsker jeg at kunne se loggen fra mine deployments af applikationer, så jeg kan se om det lykkedes

* Som udvikler ønsker jeg at kunne se loggen fra mine kørende applikationer, så jeg kan sikre mig at den kører som forventligt eller jeg kan finde ud af hvorfor den ikke gør...

#### Sandbox
Når epic'en er færdig kan en SIT kunde oprette en midlertidig bruger til sin udvikler, som kan anvende MapR fra sine udvikler pc.

* Som udvikler, vil jeg kunne forbinde til en sandkasse MapR så jeg kan begynde at udvikle applikationer der anvender dataservices (stream, file, table) uden at skulle installere min egen MapR.

### Epics til understøttelse af "applikationer"

#### Dataservice Tabel (NoSQL/OJAI)

* Som operatør ønsker jeg at begrænse adgangen til datasæt til de brugere som kunden har give tilladelse til...

#### Dataservice Stream (Kafka)

#### Dataservice File (NFS)

* Som udvikler ønsker jeg skrive og læse filer fra min applikation.


#### Data-anvender registrering (API nøgler)


Registrer anvendelse af service mhb på
  - Identificere anvendelse.
  - Sikre fair use af ressourcer.
(Overveje adgangskontrol til api-service)

Design + estimat til fredag.

Næste skridt er nok en generel PSI.

----


* Som data-ejer vil jeg begrænse adgangen til nogle services til kun de anvendere der har accepteret brugsvilkår
  - Anvendere skal kunne identificeres, enten i SIT Directory eller i platformens Directory
  - Kontaktoplysninger skal gemmes
  - Avendelser kunne lukkes.


* Som platform-ejer har jeg brug at kunne begrænse båndbredden per anvender til service
  -


* Som data-ejer vil jeg gerne kunne kontakte anvendere i forbindelse med fx fejl og ændringer



* Som data-ejer vil jeg gerne kender anvenders formål med brug af data, så jeg kan se generelle mønstre



* Som data-ejer vil jeg gerne kunne skrue ned for båndbredden for en anvender

* Som data-ejer vil jeg gerne lade API nøgler udløbe for at sikre mig at kontaktoplysninger er opdaterede


* Som data-anvender vil jeg gerne kunne anvende min API nøgle på tværs af flere data-ejere

(PSI nøgle?. til anvendelse)



### Version 1.0 primo 2019

Focus på Deploy og Monitorering så vi kan demonstrere time to market og hyppige ændringer...

Focus på platform Tabel-dataservice

Focus på Kubernetes og Services


### Version 1.1? marts 2019


### Version 1.2? juli 2019









## Principles and Governing Thoughts....

Continuous Services, Vendor neutrality, High Scaleability, Security-by-design, GDPR-by-design, DevOps and Predictable Cost.


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
Vi har identificerewt en række arbejdsgange. Her beskrives de som BPMN og vi forklarer hvordan de anvender de forskellige komponenter overfor. Under etableringen af platformen er arbejdsgange blevet væsentlig simplere og en lang række skridt er blevet fundet overflødige.


## Registrer ny applikation

<img src="reg_app.svg">


## Deploy applikation (Ops)

<img src="deploy.svg">


## Byg container (Dev)

## Test applikation
(Hvorfor er der ikke noget testmiljø)

## Give medarbejder adgang til platformsapplikationer
(eksisterende arbejdsgang. tilknytte B/X nummer til gruppe i AD)








# API Fabric

- The API Gateway is [KrakenD](http://www.krakend.io/).
- Access to Application

Responsibilities:

- Oversæt ID og tildel requestID
- Adgangspolitik (Bruger/Service -> Service)
- Throttle/circuit breaker
- Log (AccessLog/Request Log?)

## KrakenD







# App Fabric


## Kubernetes
- The application management environment is the latest standalone version of [Kubernetes](https://kubernetes.io/).
- [Application]s are given an identity in the central Directory (Axxxxx, storing ownership, access rights and "Systembeskrivelser").
- Each Application is defined by a Kubernetes Deployment.
- Each Application exposes Application Services through the use of LoadBalancers.
- Application Services are given an identity in the central Directory (mapping Sxxxxx to Applications, storing access rights and metadata).
- (consequence that all application services have access to same datasets?)


Responsibilities:
- Deploy, scale, redeploy images from Repository
- Provide Configuration Environment
- Ingress/Service Discovery
- Network (...?)
- Mount NFS as Volume (for app log?)


### K8S Service Network
Tildeles pods automatisk...

Ingress controller bruger adresserne til loadbalancing mellem instanser.
<pre>
kube-pods-subnet : XXX.XXX.XXX.XXX
</pre>

### Environment variables
Apps finder datasservices via environment variable

Note: Hvad peger de (table, stream, file?) på? Ip-adresser, DNS, virtuelle adresser?


## Docker
- The containarized application runtime environment is the latest version of [Docker](https://www.docker.com) supported by kubernetes.
- Docker [Images] are build using a common virtual image both in development and operation.
- All images are based on platform specific [Base Image].
- Each image exposed Image Services accesible only to other images in the same [Application].
- Each images implement a common schema for monitoring (should this be done at application level?)
- Each images implement a common schema for logging (should this be done at application level?)


## Base Image
- Linux afhænger af MapR
- MapR klient
- KrakenD
- Log til NFS (afprøve performance)
- App logger via stdout

<pre highlight="docker">
FROM docker:centos7

http://package.mapr.com/releases/v6.1.0/redhat/mapr-client-6.1.0.20180926230239.GA-1.x86_64.rpm

rpm -Uvh http://repo.krakend.io/rpm/krakend-repo-0.1-0.noarch.rpm


yum install -y krakend
systemctl start krakend
</pre>

Note: Missing HTTPS.... så vi skal nok hente lokalt og checksumme ...

# Data Fabric

Responsible for:
- Store datasets
- Authenticate access to inividual dataset per user/application/service
- Protect datasets against hardware failure at disk, machine and location level.
- Log of all dataoperations
- Implement dataaccess interfaces: File (NFS), Stream (Kafka), Document (OJAI), Table?


The data fabric is running latest version of [MapR](https://mapr.com/).



## MapR

### Node configuration
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

## Datasets

A dataset is a collection of individual pieces of information under the same governance. (pending definition/translation)

- Each customer has its own MapR Volume and is Data Responsible (Controller)i for all data stored.
- Each Dataset are stored in seperate sub-volumes and can have multiple representations (file, table, stream).
- Datasets are given an identity in the central Directory (mapping Dxxxxx to MapR path, storing access rights and ADMS metadata).
- Access to MapR volumes are given to [Application]s and [User]s in the central Directory. (Or should it really be Images?)
- Datasets are encrypted at rest (what keys? control?)

## Logs

- All operations on datasets are logged into one datalog stream (Log4J specification needed!), and later split on a per customer base.







# Platform Services



## Authentication

**[Secure Token Service]** All services use a common secure token platform service.
**[Federation]** Authentication of end-users are done in federation.

## Authorization

**[Rights]** All access rights (end-users and other services) are given by service or data responsible to identities recognized by the secure token service. [Uklar]
**[Authorization]** Access policy on service level is enforced in Gateway, Access policy on data level in Service



## API Key Management

<img src="id-man.svg" width="70%" align="center">


**[API Service]** Private users of Open Government Data on the GovCloud are registered with a API key.
**[API Keys]** Public Data Sharing is supported by a GovCloud platform service for API key management.




## Log
<img src="service_logging.svg" width="30%" align="right" valign="bottom">

**[Log Service]** All services use a common logging service.




## Repository
Code and image...
**[Code service]** The code repository of applications and platform services is https://git-scm.com and is a platform service at SIT.
**[Versioned Configuration]** SIT is using existing tools to maintain versions of configuration items used in the platform and in platform services.
**[Registry]** The artefact repository is [Docker Registry Server](https://docs.docker.com/registry/deploying/#use-an-insecure-registry-testing-only).

## Directory

**[Central Directory]** Users, Applications, Services and Dataset are ressources registered in the central directory service at SIT.

## Forbrugsoverblik?


## Oprettelse af brugere til sandbox


## Adgang til MapR for sandbox services





# Infrastructure (Network)
Vi beskriver netværket som det ser ud når man ankommer fra internettet....

Vi skal understøtte rolling updates og location failures samtidigt. Eventuelt tegning af L1/L2 og update gruppe A/B. Pointen er at der skal være nok maskiner med nok services i alle fire grupper til at kunne køre selvstændigt.



## Internet Network Access
GovCloud tilgås via kundens egen DNS record, der peger på ét fælles SIT kontrollet domæne, der peger på ét fast IP nummer hos Statens IT.

<pre>
cloud.gov.dk.		3589	IN	A	???.???.???.???
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

## Layout

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


1. Tillad forbindelse fra internettet til gateway for http og https, så applikationer kan anvendes af kunder, borger og virksomheder `???.???.???.???:80,443 -> 10.aaa.xxx.3`

2. Tillad forbindelse fra loadbalancer noder til nfs, ojai og kafka på MapR, så applikationer kan hente og skrive data
`10.aaa.xxx.248/29:2049,8243,5678,8083,8082 -> 10.bbb.yyy.0/24`

3. Tillad forbindelse fra applikationer til internettet, så kunders applikationer kan anvendes services på internettet.
`10.aaa.xxx.16/?? -> any`

4. Tillad forbindelse fra MapR til enkelte applikationsnoder, der kører en proxy, så der kan hentes opdateringer og måske noget med at tjekke licenser. `10.bbb.zzz.0/24 -> 10.aaa.xxx.16/??`



### Remote admin access
Beskytte med certifikater...

admin på app cluster og admin på data cluster er to roller med hver deres certifikater.

Eksterne professionel services skal anvende remote desktop med overvågning fra SIT medarbejder.




# Self-service (portal)


 Nedenstående mockups kan findes samlet <a href="https://app.moqups.com/mads.hjorth@gmail.com/PWwjFtF0KR/view">her.</a>

<img src="minimal.png" width="50%" align="right" valign="bottom">

<hr>

## Register Application

<img src="new_application.png" width="50%" align="right" valign="bottom">



## Register Service

<img src="new_service.png" width="50%" align="right" valign="bottom">

Udviklere kan registrere services på platformen. En service er en ressource på access fabric og er en forbindelse mellem et endpoint synligt udefra og et endpoint udstillet af en application på kubernetes.


## Redeploy Application

<img src="deploy.png" width="50%" align="left" valign="bottom">


## Sandbox

SIT provides limited unsupported free-of-charge GovCloud ressources to existing and prospect consumers for evaluation purposes.

Whitelist af mail domæner, re-activation efter 14 dage på samme mail... eller anden (medarbejderen stopper, udvikleren fortsætter).




## Collaboration
**[SharedOperation]** SIT provides collaborative tools to support collaboration during normal operation and during incident handling.

## GovAI
...


# Customer Applications and their responsibilities
- Applications are responsible for implementing access policies to data at row level
- Access policies should rely on trusted attributes over detailes rights when possible.





## Use of Archimate




[Application]: #application "A unit of governance"
<dfn>Dataset</dfn>: #dataset "A unit of governance"

[Log]: #datalog "A unit of governance"
  [Data Log]: #datalog "A unit of governance"
[Image]: #image "A unit of governance"
  [Base Image]: #image "A unit of governance"

[User]: #user "Physical person or Application instance outside the platform"

------------------



1. **[SysAdm tooling]** Operators at the Platform Provider choose tools suitable for automation and remote management based on individual experiences.
1. **[Test Image]** Automated test of services are done using a custom image maintained by SIT.
1. **[Acceptance test]** Service passing the provided automated tests are considered running.
1. **[Release]** Consumers label images in the repository for release based on test results.
1. **[Deploy]** In the initial version of the GovCloud PaaS releases of new versions of application services are done manually by SIT on request from the Cloud Consumer.
1. **[SLA management]** SIT is using existing tools and channels to provide data on the fullfillment of SLA and other agreements.
