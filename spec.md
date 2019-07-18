<style>
@media print {
  html { margin: 0cm 2cm 2cm 0cm; font-size: 80%; }
  /* DIGST fonts */
  body { font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;}
  h2,h3,h4, h4 dfn { font-family: "Garamond", serif; color: black; margin-bottom: 0; font-style: normal; font-weight: normal;}

  h2:not(#subtitle) { page-break-before: always; font-size: 250%; border-bottom: solid 0.5px black; padding-top: 20px; margin-bottom: 6px;}
  h3 { font-size: 145%;}
  h4 { font-size: 125%;}

  #toc {page-break-before: always;}
  /* DIGST-like frontpage */
  .head { width: 50%; margin-left: 24px; padding: 0px; background-color: #031D5C;}
  .head div { background-color: white; padding: 24px; }
  .head hr { display: none;}
  .head h1 { background-color: #031D5C; color: white; margin: 0px; padding: 50px 0px 50px 24px; font-weight: normal; }
  #subtitle { padding-left: 24px; background-color: #031D5C; color: #031D5C; }
  .head time { display: block; font-family: "Helvetica Neue", Helvetica, Arial; margin: 0px; background-color: #031D5C; font-size: 80%; color: white;}
  .toc li { line-height: 70%; font-family: "Helvetica Neue", Helvetica, Arial;
    font-weight: 600; font-size: 90%; }
  .self-link { display: none; }

  blockquote { font-size: 80%; font-style: italic; margin-left: 5%; width: 70%; border-left-width: 2px;}
	h2#abstract {display: none;}
	.p-summary {width: 50%; margin-left: 24px; padding: 0px;}

}
</style>
<pre class='metadata'>
Title: cloud.gov.dk spec
Status: LD
URL: http://github.com/digst/cloud/spec.md
Editor: Mads Hjorth, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Abstract: Beskrivelse af implementeringen af GovCloud PaaS.
Boilerplate: copyright no, conformance no,
Shortname: spec
Markup Shorthands: markdown yes
Repository: digst/cloud
Inline Github Issues: full
Logo: https://digst.github.io/cloud/cloud.svg
</pre>


<h1>Specifikation <br> GovCloud PaaS <br> Statens IT</h1>




<h2 class="no-num">Introduction</h2>
<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>


<img src="resume.svg">


# Motivation
God arkitektur er løsninger på et problem.

*Hvordan tager de offentlige bedst cloud-teknologier i brug?*

Denne arkitektur sigter mod at øge anvendelsen af data der registreres af offentlige myndigheder (formuleres som problem?).

(Hvilke assesments har vi? Disruption er sket...)

Effektiv it-udvikling, men det er næppe de direkte gevinster der er de vigtigste/største, it-udgifter er specielle, fordi hvis de bruges rigtige spares rigtig mange penge, men de kan også bruges på en måde der ikke giver meget værdi (fx flytte data rundt, fremfor at lave gode brugeroplevelser/hyppige tilpasninger)

Skal vi ikke have nogle drivers / outcomes med? og nogle stakeholders?


## Designprincipper

**Uafbrudte services** Platformen og dens applikationer er bygget med henblik på at understøtte uafbrudte services både under opdatering af enkelte services og hele platformen. Det betyder at der ikke eksisterer aftale service-vinduer, at services kan kører i forskellige versioner og infrastruktur og middleware etableres med hensyn til high-availability. Princippet følger tendenser med digital selvbetjening skal være tilgængelig 24/7 da brugere anvender dem på alle tider af døgnet og fra hele verden.

**Leverandøruafhængighed** Data, applikation og services på Platformen skal effektivt kunne flyttes til en anden cloud platform. Det betyder at teknologivalg og snitflader mellem komponenter skal nøje overvejes så bindinger til enkelt leverandører undgås. Fordi det er en fælles platform, er valget ikke op til den enkelte anvender, men træffes i fællesskab. Dette sikres gennem anvendelse af standardiserede snitflader, der understøttes af open source implementeringer.

**Skalérbar platform** Forvaltning, support og komponenter skal kunne håndtere mange applikationer med begrænset tilføjelse af ressourcer. Dette betyder at platform services realiseres gennem anvendelse af enterprise-grade komponenter med professional services-aftaler, at der tidligt i udviklingen er fokus på automatisering af daglige opgaver samt at platformen kan anvendes alene gennem selvbetjening uden involvering af udbyderen. Skalérbarheden giver ikke bare stordriftsfordele, men er en grundlæggende ændringer i opgavefordeling.

**GDPR-by-design** Platformen er forberedt til behandling af persondata og andre følsomme data i hht. GDPR. Det betyder datasubjekters rettigheder og dataansvarliges pligter på sigt understøttes af fælles services. Princippet om privacy-by-design betyder at der tidligt i udviklingen indtænkes sikkerheds-kontroller og privacy-barriere, i form af tekniske service, men også i form af nye opgaver og ansvar. Særligt den såkaldte krigsregel betyder at særlige kristisk applikationer kan kræves at blive opbevaret på dansk territori. Derfor opbevares applikationer og data indledningsvis alene hos og af SIT (on-premise), men senere kan udvalgte applikationer og data også driftes i eksterne driftsmiljøer (scale-out til public clouds).


**Security-by-design** Platformen er designet på en måde der sikrer høj informationssikkerhed for applikationer og data, bl.a. ved kryptering af data, integreret brugerstyring og overvågning af netværkstrafik.


**Omkostningssikker** Platformens driftsmodel sikrer, at kunders omkostninger til platform-services er forudsigelige.

**Agil it-udvikling** Platformen og dens driftsmodel skal understøtte applikationsudvikling baseret på DevOps og Continuous Delivery.


## Arkitekturstil

SOA, Cloud, PaaS. API enabled GUI.

Layered architecture (each layer scale idependently and different governance processes for: Data, Application and Access)

One platform? (staging on the same platform, run on dev laptop, integrated automated test, multiple versions of same service, active-active)

And supporting services.... some for developers and some for applications (API).

Pure Archimate ... vi har valgt at sætte lighedstegn mellem platform of technology og lade kunders applikationer være blå. Det gør det muligt at synliggøre ansvarsfordelingen mellem platform og applikations som beskrevet i driftsmodellen (PaaS).

# Business
På et forretningsmæssigt niveau kan platformen kan beskrives ved tre roller og fire områder for samarbejde. Herunder findes seks vigtige opgaver, nemlig Arkitekturstyring, Applikationsudvikling og -drift, Overvågning og eventhåndtering, Hændelseshåndtering, Problemhåndtering samt Sikkerhed og ressourceafgrænsning. I nedenstående tegning bliver relationen mellem de tre roller, fire arbejdsområder og seks opgaver præsenteret.

<img src="roles.svg" width="75%">

## Roller og områder for samarbejde

### <dfn export="true">Platformsudbyder</dfn>
- Virksomhed der er ansvarlig for at stille en tjeneste (PaaS) til rådighed for andre interesserede virksomheder.

For denne platform er udbyderen Statens IT, der indkøber og forvalter den nødvendige fysisk infrastruktur og softwareinstallationer, og gør begge dele tilgængelig for platformsanvendere.

<blockquote cite="https://doi.org/10.6028/NIST.SP.500-292">
A cloud provider is a person, an organization; it is the entity responsible for making a service available to interested parties. A Cloud Provider acquires and manages the computing infrastructure required for providing the services, runs the cloud software that provides the services, and makes arrangement to deliver the cloud services to the Cloud Consumers through network access. [[NIST.SP.500-292]]
</blockquote>

### <dfn export="true">Platformsanvender</dfn>
- Virksomhed der indgår i en relation med, og anvender tjenester fra en platformsudbyder.

For denne platform gælder det mere specifikt at platformsanvenderen er en eksisterende kunde hos Statens IT og derfor oftest vil være en offentlig myndighed på statsligt niveau. Vi bruger termen virksomhed for at gøre det eksplicit at anvenderen har et CVR-nummer.

<blockquote cite="https://doi.org/10.6028/NIST.SP.500-292">
A cloud consumer represents a person or organization that maintains a business relationship with, and uses the service from a cloud provider. [[NIST.SP.500-292]]
</blockquote>


### <dfn export="true">Policy-ansvarlig</dfn>
- myndighed der er ansvarlig for de overordnede rammer for udvikling og anvendelse af it, særligt hos andre offentlige myndigheder.




<blockquote cite="http://www.form-online.dk/opgavenoegle/06/#06.38.10">
De overordnede rammer for digitaliseringen af samfundet, herunder tværgående arkitektur, offentlige data og it-standarder [[FORM]]</blockquote>

## Opgaver

Som præsenteret i illustrationen i starten af afsnittet samarbejder de tre roller om en række opgaver (practices).

<blockquote>
In ITIL 4, practices are a set of organizational resources designed for performing work or accomplishing an objective. [[ITIL4]]
</blockquote>

Herunder har beskriver vi de seks vigtigste opgaver, som rollerne arbejder sammen om at løfte.


### <dfn export="true">Arkitekturstyring</dfn>
- forvaltningsopgave .... (tjek FDA)

<blockquote cite="https://www.bmc.com/blogs/itil-management-practices/">
To provide an understanding of all the different elements that make up an organization and how those elements interrelate, enabling the organization to effectively achieve its current and future objectives. It provides the principles, standards, and tools that enable an organization to manage complex change in a structured and agile way. [[ITIL4]]
</blockquote>

Ansvaret for opgaven er delt mellem policy-ansvarlig og platformsudbyder. Policy-ansvarlig har ansvaret for beskrivelsen af den del af arkitekturen som er synlig for anvenderen dvs. platform services og platform api. Udbyderen har derimod ansvaret for den del af arkitketuren der realisere de beskrevne services og interfaces.

Polic-ansvarlig sikre at princippet om leverandøruafhængighed overholdes ved at basere platform services og api på modne og veletablerede specifikationer og standarder fx ved brug af CAMMS...

Udbyderen sikrer at princippet om uafbrudte services og skalérbarhed  overholdes ved at vælge middleware komponenter der er bedst egnet til formålet og passer til organisations øvrige teknologivalg og driftsmodeller.

### <dfn export="true">Applikationsudvikling og -drift</dfn>

<blockquote cite="https://en.wikipedia.org/wiki/DevOps">
DevOps is a set of software development practices that combine software development (Dev) and information technology operations (Ops) to shorten the systems development life cycle while delivering features, fixes, and updates frequently in close alignment with business objectives. [[ITIL4]]
</blockquote>

Anvenderen har ansvaret for udviklingen og anvendelsen af egne applikationer.

Policy-ansavrlig bidrager med vejledning

### <dfn export="true">Statusovervågning</dfn>

<blockquote cite="https://www.bmc.com/blogs/itil-management-practices/">
To systematically observe services and service components, and record and report selected changes of state identified as events, through identifying and prioritizing infrastructure, services, business processes, and information security events, and establishing the appropriate response to those events, including responding to conditions that could lead to potential faults or incidents. [[ITIL4]]</blockquote>


### <dfn export="true">Hændelseshåndtering</dfn>

<blockquote cite="https://www.bmc.com/blogs/itil-management-practices/">
To minimize the negative impact of incidents by restoring normal service operation as quickly as possible.[[ITIL4]]
</blockquote>

### <dfn export="true">Problemhåndtering</dfn>

<blockquote cite="https://www.bmc.com/blogs/itil-management-practices/">
To reduce the likelihood and impact of incidents by identifying actual and potential causes of incidents, and managing workarounds and known errors. [[ITIL4]]
</blockquote>

### <dfn export="true">Sikkerhed og ressourcestyring</dfn>

Multitenancy...

- Applications (and Service and Datasets) are treated like first class tenants because ownership changes over time. But always a clear owner (customer) to a tenant.
- Applications are responsible for implementing access policies to data at row level
- Access policies should rely on trusted attributes over detailes rights when possible.

### <dfn export="true">Privacy?</dfn>


## Arbejdsgange/Brugeroplevelser
Vi har identificeret fire centrale arbejdsgange eller samarbejdsområder som de forskellige roller kan udføre. I det nedenstående  beskriver vi den brugeroplevelse vi sigter efter og vi forklarer sammenhængen til de seks centrale opgaver overfor.

### Registrere Applikationer, Datasamlinger og Services
Har til formål at sikre beskrivende felter til mange formål.

Especially Information, Software and Services from ISO 27001 Information Asset Inventory.



Oprettes manuelt på MapR. Bør formentlig flyttes til en SIT branded selvbetjeningsløsning med få felter... Fællesoffentlige DCAT/ADMS profil, som opbevares i Directory (og kan udstilles i Datasætkatalog)

Rancher installation. K8S ressources. Bør formentlig flyttes til en SIT branded selvbetjeningsløsning med få felter... som danner en passende servicebeskrivelse, som opbevares i Directory.

Udviklere kan registrere services på platformen. En service er en ressource på access fabric og er en forbindelse mellem et endpoint synligt udefra og et endpoint udstillet af en application på kubernetes.


### DevOps
(Beskrive lidt om hvad opgaverne består i... måske relatere dem til services?)


* **Plan**
* **Code**
* **Build**
* **Test** (Hvorfor er der ikke noget testmiljø? Fordi kunden selv etablere forskellige applikationer, der kan anvende samme containere og datasæt til forskellige formål)
* **Release**
* **Deploy**
* **Operate** (eksisterende arbejdsgang. tilknytte B/X nummer til gruppe i AD)
* **Monitor**


### Collaborative Incident Management
Har til formål at få services op at kører.. men er kompleks fordi der både er en platform, en applikation og en status overvågning...

SIT provides collaborative tools to support collaboration during normal operation and during incident handling.

### Sandbox

SIT provides limited unsupported free-of-charge GovCloud ressources to existing and prospect consumers for evaluation purposes.

Whitelist af mail domæner, re-activation efter 14 dage på samme mail... eller anden (medarbejderen stopper, udvikleren fortsætter).

Implementeres som et 'one-node' image af CloudAPI der kan spindes op ved hjælp af OpenStack eller hentes hjem til lokalt kunde miljø.

Bør kunne laves med tilpasning af Ansible scripts der anvendes til installation af platformen.

# Application

<img src="platform.svg"/>

(Alt det med blåt.... Application Layer, <a href="http://pubs.opengroup.org/architecture/archimate3-doc/chap09.html#_Toc489946063">Archimate</a>)


## Applilkationstjeneste (Tjek FDA)
I denne platform er en applikationstjeneste enten en konkret webapplikation eller en webservice som forvaltes af en platformanvender. Applikationstjenester er tilgængelig fra internettet via en URL og anvender typisk HTTPS som protokol og enten HTML eller XML/JSON som payload.

Applikationstjenester anvendes enten af medarbejder hos den enkelte myndighed eller af borger og virksomheder som en del af en offentlig opgave.

Det kunne fx være en hjemmeside med en selvbetjeningsløsning eller en webservice hvor man kan hente aktuelle vejrobservationer.

<blockquote cite="http://pubs.opengroup.org/architecture/archimate3-doc/chap09.html#_Toc489946068">
An application interface represents a point of access where application services are made available to a user, another application component, or a node.
</blockquote>

<blockquote cite="http://pubs.opengroup.org/architecture/archimate3-doc/chap09.html#_Toc489946075">
An application service represents an explicitly defined exposed application behavior.
</blockquote>


## Application (Component) (Tjek FDA)


<blockquote cite="http://pubs.opengroup.org/architecture/archimate3-doc/chap09.html#_Toc489946066">
An application component represents an encapsulation of application functionality aligned to implementation structure, which is modular and replaceable. It encapsulates its behavior and data, exposes services, and makes them available through interfaces.
</blockquote>

## Container

<blockquote cite="https://docs.docker.com/glossary/?term=container">
A container is a runtime instance of a docker image.
</blockquote>



## Dataset (Tjek FDA)



<blockquote cite="https://arkitektur.digst.dk/sites/default/files/20180503_rad_v1.0_-_godkendt_af_sda.pdf">
en samling af oplysninger bestående af enkelte dele der forvaltes under et
</blockquote>


Bemærk at vi ikke bruger termen it-system... Hvis vi gjorde ville det omfatte alle de nødvendige dele for at realisere en Applikationstjeneste... og det er mange... inkl strømforsyning, tidsservere og mennesker...



## Source Code
Den kildekode og andre artifakter som anvendes til at bygge et image. Oftest skrevet i et programmeringssprog som Java eller Go, men kan også være grafikelementer, installationsscripts og andet.

Kildekoden findes ofte i flere samtidige branches og har tilknyttet version der opdateres ved ændringer og markering af releases, som er særlige version der fx er taget i brug eller blevet afprøvet.


## Images
er resultatet af et byg på baggrund af en version af kildekoden.

I docker er navngivet ejer/navn for at synliggøre ejerskabet.

Note: Et namespace per platformsanvender/virksomhed?

<blockquote cite="https://docs.docker.com/glossary/?term=image">
Docker images are the basis of containers. An Image is an ordered collection of root filesystem changes and the corresponding execution parameters for use within a container runtime. An image typically contains a union of layered filesystems stacked on top of each other. An image does not have state and it never changes.</blockquote>


## Tags
Et docker images kan tagges med flere tags.

De anvendes fx ved deployment, ejer/navn:prod

Note: Vi bør have anbefalinger for et fælles skema i udviklingshåndbogen.

<blockquote cite="https://docs.docker.com/glossary/?term=tag">
A tag is a label applied to a Docker image in a repository. Tags are how various images in a repository are distinguished from each other.
</blockquote>





# Technology

<img src="platform.svg"/>

(Alt det med Grønt (og gråt).... Technology Layer,
<a href="http://pubs.opengroup.org/architecture/archimate3-doc/chap10.html#_Toc489946081">Archimate</a>


## Fabrics...
nnnk c
### Service Fabric
Responsibilities:
- Oversæt ID og tildel requestID
- Adgangspolitik (Bruger/Service -> Service)
- Throttle/circuit breaker
- Log (AccessLog/Request Log?)


### Application Fabrics
Responsibilities:
- Deploy, scale, redeploy images from Repository
- Provide Configuration Environment
- Ingress/Service Discovery
- Network (...?)
- Mount NFS as Volume (for app log?)

### Data Fabric
Responsible for:
- Store datasets
- Authenticate access to inividual dataset per user/application/service
- Protect datasets against hardware failure at disk, machine and location level.
- Log of all dataoperations
- Implement dataaccess interfaces: File (NFS), Stream (Kafka), Document (OJAI), Table?


## Platform API
alle webservices der kan kaldes inde fra anvenderens applikationer.

Adgangskontrol til data via rettigheder i directory/registry.

Dataservices...

### `/file` (NFS)

### `/table` (NoSQL)

### `/stream` (Kafka)

### `/ldap` (Opslag i directory)



### `/log`
platformen skriver fra application services og dataservices.

anvenders applikations skriver også...

sammenstille, søge og hente

- All operations on datasets are logged into one datalog stream (Log4J specification needed!), and later split on a per customer base.

### `/token`
Oversætte id-tokens fra ekstern IdP. Måske oversætte til interne id'er. JWT?

!Authentication Findes ikke på platformen men sker hos IdP. Federation til Directory. Fx... binde NemId sammen med B-numre.








## Platform Services
alle med brugergenkendelse gennem SIT AD.

Web applikationer i browsere til brug for ansatte og konsulenter hos platformsanvender.



### `git.govcloud.dk`

### `reg.govcloud.dk`

### `k8s.govcloud.dk` (portal.)

### `status.govcloud.dk`

og noget med `<kunde>.status.govcloud.dk`

### `collab?.govcloud.dk`



## Middleware

### Gravitee



### Rancher
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


A dataset is a collection of individual pieces of information under the same governance. (pending definition/translation)

- Each customer has its own MapR Volume and is Data Responsible (Controller)i for all data stored.
- Each Dataset are stored in seperate sub-volumes and can have multiple representations (file, table, stream).
- Datasets are given an identity in the central Directory (mapping Dxxxxx to MapR path, storing access rights and ADMS metadata).
- Access to MapR volumes are given to [Application]s and [User]s in the central Directory. (Or should it really be Images?)
- Datasets are encrypted at rest (what keys? control?)

(Er det mulig at bruge symlinks til at referere til datasæts via både FORM, CVR )


### KeyCloak

### FreeIPA
Product with OpenLDAP interface. Data opbevares uden for MapR, men findes i kopi på MapR. Oplysninger om Kunder og Bruger hentes fra SIT AD.

Derudover gemmes identiteter og oplysninger om Applikationer, Services, Datasæt (D-numre) og rettigheder imellem disse og Kunder og Brugere.

Rettigheder anvendes af MapR og af Access Fabric.

Oplysninger om henholdvis services, applikationer og datasæt modelleres efter de fælles offentlige modeller herfor (se data.gov.dk).

Overvej ikke at gøre for mange felter obligatoriske fra starten. Lad kunne vedligeholde oplysninger gennem selvbetjening og uden om (ex excel). Custom felter? Henvisninger til stereotyper fra Referencearkitekturer.

- Each Application exposes Application Services through the use of LoadBalancers.
- Application Services are given an identity in the central Directory (mapping Sxxxxx to Applications, storing access rights and metadata).
- (consequence that all application services have access to same datasets?)

### GitLab

GitLab installation. Bør kører som applikation i K8S med AD integration og opbevare code som datasæt på MapR. Kræver vist in SQL database som skal installeres sammen med. Helm?


### Habor
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



<h2 class="no-num">Appendix</h2>

## Inspiration til udarbejdelse af kontrakter

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



<pre class="biblio">

{
	"ITIL4": {
		"date": "2019",
    "href":"https://en.wikipedia.org/wiki/Special:BookSources?isbn=978-011331607",
    "id":"ISBN 978-0113316076",
    	"title": "ITIL Foundation, ITIL 4 edition.",
		"publisher": "TSO (The Stationary Office)",
		"deliveredBy": [
			"AXELOS"
		]
	}
  ,
  "NIST.SP.500-292": {
    "href": "https://doi.org/10.6028/NIST.SP.500-292",
    "title": "NIST Cloud Computing Reference Architecture",
    "date": "September 2011"
    }
  ,
  "FORM": {
      "href": "http://www.form-online.dk",
      "title": "Opgavenøglen v2.14",
      "date": "Juli 2019"
      }

}

 </pre>
