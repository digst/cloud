<pre class='metadata'>
Title: cloud.gov.dk guide
Status: LD
URL: http://github.com/digst/cloud/guide.md
Editor: madsh@digst.dk, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Boilerplate: table-of-contents no, copyright no, conformance no, abstract no, index no, idl-index no
Repository: digst/cloud
Inline Github Issues: full
</pre>
<h1>Developers Guide<img src="cloud.svg" align="right"> <br> GovCloud PaaS <br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>




# Velkommen!

GovCloud vision: Fremtidens foretrukne udviklings- og drifts-miljø for Statens ITs kunder.

I opgave beskrivelsen har der formentlig stået noget om .. .Udvikling af container baserede applikationer, Anvendelse af asynkrone meddelelser som integration mellem applikationskomponenter,  Anvendelse af NoSQL dokumentdatabaser, Udvikling af HTTP services der følger REST, Token baseret adgangskontrol.

Dette dokument forsøger at gøre det meget konkret hvordan vi har tænkt at applikationer bedst udvikles på netop vores platform.

Så velkommen til fremtiden! Og håb om at I finder jeg godt tilpas på platformen...


# Hvad er GovCloud

3 linjer om cloud.

3 linjer om Gov+Cloud

PaaS... med mulighed for SaaS

CloudBroker


# Hvad tilbyder GovCloud

5 + 5 services...

GovCloud er en selvbetjent og i høj grad automatiseret service leveret af Statens IT. Den samlede service består dels af en selvbetjenings-løsning der anvendes af ansatte og konsulenter hos Statens ITs kunder, dels af en række tekniske services der anvendes af kundes applikationer. [Sætning om at den samlede lifecycle management for den samlede GovCloud service foretages i fæøllesoffentligt regi].

| Til udviklere | Til applikationer |
|---            |---                |
| git -- opbevaring og versionsstyring af applikationskode      | /id -- billetudsteder og omveksler              |
| reg  -- opbevaring og versionsstyring af applikations images  | /log -- opsamling og søgning i hændelser             |
| kub -- selvbetjening til deployment af applikationer          | /stream -- data i meddelelsstrømme          |
| stat -- overvågning af platform og applikationer              | /table -- data på tabelform            |
| coll -- online samarbejdsværktøj                              | /file -- data i filer og foldere            |

Mere detaljerede beskrivelser nedenfor.




# Før du går i gang

Advarsel.... Cloud Native og DevOps er et meget stor skift i den måde vi tænker applikationer på. Bla.

* Services, Apllikationer og Data forvaltes særskilt... siloen er væltet..og rejst igen.

* Platformen skalerer... så ok at svine lidt med pladsen...vente med at optimere. Forudsætning er bla. REST. Stateless! Det er vigtigt hvad der ryger i hvilke container.

* Service kan implementeres meget simpelt. ... ex Go uden midleware... så pas på med bloaded midleware

Noget af det kan læses på microservices / 12 factor apps




# Data


## Data Controller
GDPR Principle of "accountability" (ref art 5, stk 2) extends to all data.

All data stored in the platform MUST have a registered data controller.

# Applications

<dfn>Application</dfn> is a something




## Docker Images


## Deployments


## Developer enviroment

### Your own laptop

1. Install MapR developer container

2. Application Container
  - From Scratch (should be SIT base image)
  - plus java
  - plus mapr.jar (avoid?)


# User and application interfaces


<img src="highlevel.svg" width="100%" align="center">



## Selvbetjeningsløsning(er)

For at kunne komme hurtigt igang og for at hurtigt at kunne efterprøve kunders behov, er der etableret en midlertidig selvbetjeningsløsninger på `k8s.govcloud.dk`. Løsningen er realiseret ved anvendelse af <a href="https://rancher.com/">Rancher</a>.

* <a href="http://k8s.govcloud.dk"><code>k8s.govcloud.dk</code></a>&nbsp;&nbsp;<small>version 1 - 20190201</small>

Her understøttes kunders deployment og monitorering af applikationer, samt deployment af services.

Det er planen at udvikle en simple og mere målrettet selvbetjening, der skal sikre større uafhængighed af den underliggende implementering, og tillade tilpasning af sprogbrug til fællesoffentlige begreber om it-systemer. Ansvaret for løsningen er stadig under diskussion.

* <a href="http://cloud.gov.dk"><code>cloud.gov.dk</code></a>&nbsp;&nbsp;<small>Endnu ikke planlagt</small>

## Tekniske services til applikationer  (GovCloud API?)
I henhold til aftalen om GovCloud, skal den fulde lifecycle af tekniske services styres i fælles regi. Det vi sige at der løbende tages stilling til hvilke services der tilføjes og eventuelt udfases.

Følgende services er tilgængelig i GovCloud Platform API 1.0.

### ID
Applikationer der ønsker at genkende brugere der allerede kendes af Statens IT, kan anvende platformens secure token service / billetomveksler. Kald til applikationsservice der er kræver en genkendt bruger vil få tilknyttet et <a href="https://jwt.io/">JSON Web Token</a> med oplysninger om brugerens identitet. Hvis der er brug for omveksling af identitetet mellem forskellige idp'er eller føderationer kan den interne secure token service anvendes.

* <code>sts.govcloud.dk</code> <small>version 1 - 20190201</small>

### Dataservice
Adgangskontrol til kunders datasæt styres på applikationsniveau og håndhæves af platformen. Dataservice lader applikationer skrive og læse datasæt gennem tre forskellige protokoller:

<a href="https://tools.ietf.org/html/rfc7530">Network Files System (NFS)</a> lader applikationer skrive og læse binære filer fra en lang række operativsystemer og programmeringssprog. Et datasæt repræsenteres af et NFS Directory.

* <code>data.govcloud.dk:2049</code> <small>version 1 - 20190201</small>
<!-- * `data.govcloud.dk/nfs` <small>Endnu ikke planlagt</small>-->

<a href="https://kafka.apache.org/">Apace Kafka</a> lader applikationer skrive og læse meddelelser til streams og topics. Et datasæt repræsenteres af en Kafka Stream.

* <code>data.govcloud.dk:8082</code> <small>version 1 - 20190201</small>
<!-- * `data.govcloud.dk/kafka` <small>Endnu ikke planlagt</small>-->

<a href="http://www.ojai.io">OJAI</a> lader applikationer at skrive og læse JSON dokumenter til dokumentsamlinger. Et datasæt repræsenteres af en OJAI Document Store.

* <code>data.govcloud.dk:8243</code> <small>version 1 - 20190201</small>
<!-- * `data.govcloud.dk/kafka` <small>Endnu ikke planlagt</small>-->

### Log
Applikationers stdout/stderr, Service Fabric og Data Fabric sender loghændelser til en fælles log service. Log filer er tilgængelig i selvbetjeningsløsninger og for kundens applikationer via

* <code>log.govcloud.dk</code> <small>TBD</small>
<!-- * `data.govcloud.dk/log` <small>Endnu ikke planlagt</small>-->


### Directory
Oplysninger om kundens services, applikationer, datasæt og deres rettigheder gemmes af selvbetjeningsløsningen i Directory servicen. Oplysningerne er tilgængelige for kundens applikationer via LDAP.

* <code>ldap.govcloud.dk:349</code> <small>TBD</small>
<!-- * `data.govcloud.dk/directory` <small>Endnu ikke planlagt</small>-->




### External keys
Kunder der ønsker at begrænse anvendelsen af applikations services kan anvende eksterne nøgler (API keys). Eksterne nøgler giver ingen ekstra sikkerhed, men en mulighed for at begrænse eller identificere adgang ved fx misbrug.

* <code>services.govcloud.dk/keyman</code> <small>version 1 - TBD</small>


## DevTools (SaaS)
Statens IT tilbyder - som supplement til GovCloud - en række sammenhængende services til brug for applikationsudvikling. På sigt vil en fuld DevOps proces kunne understøttes hos SIT, men indledningsvis tilbydes services til opbevaring af kildekode og docker container images.

### Code repository
Kunder kan bringe deres applikationskode under versionskontrol i det fælles repository med authentication fra Statens ITs centrale brugerstyring.

* <a href="http://git.govcloud.dk"><code>git.govcloud.dk</code></a> <small>version 1 - 20190201</small>

### Container Image Repository
Kunder kan opbevare container images til deployment på GovCloud i det fælles repository med authentication fra Statens ITs centrale brugerstyring.

* <a href="http://gitlab.govcloud.dk"><code>gitlab.govcloud.dk</code></a> <small>version 1 - 20190201</small>






# Examples of usage GovCloud PaaS


## Datadistribution

## Trusted Messaging

## Datascience/BI/Analytics

## Static Website







## RPA Robot Proces Automation
