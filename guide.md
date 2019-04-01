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


GovCloud er en selvbetjent og i høj grad automatiseret service leveret af Statens IT. Den samlede service består dels af en selvbetjenings-løsning der anvendes af ansatte og konsulenter hos Statens ITs kunder, dels af en række tekniske services der anvendes af kundes applikationer. [Sætning om at den samlede lifecycle management for den samlede GovCloud service foretages i fæøllesoffentligt regi].

## Selvbetjeningsløsning(er)

For at kunne komme hurtigt igang og for at hurtigt at kunne efterprøve kunders behov, er der etableret en midlertidig selvbetjeningsløsninger på `k8s.govcloud.dk`. Løsningen er realiseret ved anvendelse af <a href="https://rancher.com/">Rancher</a>.

* <a href="http://k8s.govcloud.dk"><code>k8s.govcloud.dk</code></a>&nbsp;&nbsp;<small>Fra 20190201</small>

Her understøttes kunders deployment og monitorering af applikationer, samt deployment af services.

Det er planen at udvikle en simple og mere målrettet selvbetjening, der skal sikre større uafhængighed af den underliggende implementering, og tillade tilpasning af sprogbrug til fællesoffentlige begreber om it-systemer. Ansvaret for løsningen er stadig under diskussion.

* <a href="http://cloud.gov.dk"><code>cloud.gov.dk</code></a>&nbsp;&nbsp;<small>Endnu ikke planlagt</small>

## Tekniske services til applikationer  (CloudAPI?)
I henhold til aftalen om GovCloud, skal den fulde lifecycle af tekniske services styres i fælles regi. Det vi sige at der løbende tages stilling til hvilke services der tilføjes og eventuelt udfases.

Følgende service er tilgængelig i første version af GovCloud.

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


### Directory
Oplysninger om kundens services, applikationer, datasæt og deres rettigheder gemmes af selvbetjeningsløsningen i Directory servicen. Oplysningerne er tilgængelige for kundens applikationer via LDAP.

* <code>ldap.govcloud.dk:349</code> <small>TBD</small>
<!-- * `data.govcloud.dk/directory` <small>Endnu ikke planlagt</small>-->

### Log
Applikationers stdout/stderr, Service Fabric og Data Fabric sender loghændelser til en fælles log service. Log filer er tilgængelig i selvbetjeningsløsninger og for kundens applikationer via

* <code>log.govcloud.dk</code> <small>TBD</small>
<!-- * `data.govcloud.dk/log` <small>Endnu ikke planlagt</small>-->

### ID
Applikationer der ønsker at genkende brugere der allerede kendes af Statens IT, kan anvende platformens secure token service / billetomveksler. Servicen returnerer en <a href="https://jwt.io/">JSON Web Token</a> med oplysninger om brugerens identitet.

* <code>sts.govcloud.dk</code> <small>version 1 - 20190201</small>

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
