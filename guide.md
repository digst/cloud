<pre class='metadata'>
Title: cloud.gov.dk guide
Status: LD
URL: http://github.com/digst/cloud/guide.md
Editor: madsh@digst.dk, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Boilerplate: table-of-contents yes, copyright no, conformance no, abstract no, index no, idl-index no
Repository: digst/cloud
Inline Github Issues: full
</pre>

<h1>Developers Guide<img src="cloud.svg" align="right"> <br> GovCloud PaaS <br> Statens IT</h1>

<small>
Dette dokument er en vejledning i udarbejdelse af applikationer på et nye udviklings- og driftsmiljø hos Statens IT. Det er en del af en serie af dokumenter, der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en generel <a href="https://digst.github.io/cloud/intro.html">introduktion</a> og en teknisk <a href="https://digst.github.io/cloud/spec.html"> specifikation</a>.</small>

<h2 class="no-num">Velkommen!</h2>

GovCloud vision: Fremtidens foretrukne udviklings- og drifts-miljø for Statens ITs kunder.

I opgave beskrivelsen har der formentlig stået noget om.. .Udvikling af container baserede applikationer, Anvendelse af asynkrone meddelelser som integration mellem applikationskomponenter,  Anvendelse af NoSQL dokumentdatabaser, Udvikling af HTTP services der følger REST, Token baseret adgangskontrol.

Dette dokument forsøger at gøre det meget konkret hvordan vi har tænkt at applikationer bedst udvikles på netop vores platform.

Så velkommen til fremtiden! Og håb om at I finder jeg godt tilpas på platformen...


<h3 class="no-num">Hvad er GovCloud</h3>

3 linjer om cloud.

3 linjer om Gov+Cloud

PaaS... med mulighed for SaaS

CloudBroker

<h3 class="no-num"> Hvad tilbyder GovCloud</h3>

5 + 5 services...

GovCloud er en selvbetjent og i høj grad automatiseret service leveret af Statens IT. Den samlede service består dels af en selvbetjenings-løsning der anvendes af ansatte og konsulenter hos Statens ITs kunder, dels af en række tekniske services der anvendes af kundes applikationer. [Sætning om at den samlede lifecycle management for den samlede GovCloud service foretages i fæøllesoffentligt regi].

<table style="width:100%">
  <tr>
    <th>Til udviklere </th>
    <th>Til applikationer</th>
  </tr>
  <tr>
    <td><code>git.</code> – opbevaring og versionsstyring af applikationskode</td>
    <td><code>/id</code> -- billetudsteder og omveksler</td>
  </tr>
  <tr>
    <td><code>reg.</code>  – opbevaring og versionsstyring af applikations images</td>
    <td><code>/log</code> -- opsamling og søgning i hændelser</td>
  </tr>
  <tr>
    <td><code>kub.</code> – selvbetjening til deployment af applikationer</td>
    <td><code>/stream</code> -- data i meddelelsstrømme/td>
  </tr>
  <tr>
    <td><code>stat.</code> – overvågning af platform og applikationer</td>
    <td><code>/table</code> -- data på tabelform </td>
  </tr>
  <tr>
    <td><code>coll.</code> – online samarbejdsværktøj</td>
    <td><code>/file</code> -- data i filer og foldere</td>
  </tr>
</table>



Mere detaljerede beskrivelser nedenfor.

<h2> Før du går i gang</h2>

Advarsel.... Cloud Native og DevOps er et meget stor skift i den måde vi tænker applikationer på. Bla.

-   Services, Apllikationer og Data forvaltes særskilt... siloen er væltet..og rejst igen.

-   Platformen skalerer... så ok at svine lidt med pladsen...vente med at optimere. Forudsætning er bla. REST. Stateless! Det er vigtigt hvad der ryger i hvilke container.

-   Service kan implementeres meget simpelt. ... ex Go uden midleware... så pas på med bloaded midleware

Noget af det kan læses på microservices / 12 factor apps

Centrale begreber Som sagt, er det et skift. Og vi skal lige være enige om nogle centrale begreber for ikke at få forbi hinanden.

<h3>Services</h3>
Der er services (SOA). Og forskellige slags. Applikations Service er dem som en myndigheds 'kunder' (borgere og virksomheder) kan se. Platform services er dem SIT tilbyder myndigheder i rollen som platformsanvender 'kunder hos statens it'. To slags platform services. Dem mod mennesker og dem mod applikationer.

<h3>Applikationer</h3>
Der er applikationer. Og de består af komponenter. Er lavet af kode og pakket ind i images der kan kører i containere.

<h3>Data</h3>
Der er data. GDPR Principle of "accountability" (ref art 5, stk 2) extends to all data. All data stored in the platform MUST have a registered data controller.

Så hvad er en 'løsning'... Det er de dele der skal fungere for at en applikationsservice virker, nogle dele kontrolleres af udbyderen af servicen, andre af platformsudbydere og andre igen måske af andre udbydere.


<h2>En eksemplarisk applikation – <code>ForTheBirds</code></h2>
Vi vil anvende et gennemgående eksempel <code>ForTheBirds</code> der gradvist udvides og tager de forskellige dele af platformen i anvendelse, og vi prøver at følge en 'naturlig' rækkefølge.

Applikationer løser problemer og her er vores...

<i>Vi ønsker at overvåge platformens tilstand og rapporterer det til en extern status service</i>

Verden er ikke sort/hvid og platforme er ikke rød eller grøn. Så vi har brug for detaljerede granulerede statusser, så anvender selv kan vurdere om de dele der er nødvendige for deres applikationer er i status hvor anvender skal til at gøre noget... "Sætte et skilt op i vinduet"...

For at gøre det nemmere (og lidt sjovere) bruger vi en analogi/en fælles reference. Pixars For The Birds. En lang række små fugle med hver sin personlighed, ser forskellige dele af verden. Og der kan være mange fugle på samme tråd.


<h3>Code</h3>

Vi starter på en din egen bærbare. Men jeg har jo en cloud.... jo men du skal da ikke stoppe med at udvikle bare fordi nettet ryger eller du sidder på et fly.

https://www.docker.com/blog/docker-golang/

Can we lave runde store bullets til steps. Måske to niveauer. Måske passe med DevOps Cycle...

- Find a git repository to place your code in. Lets use github, because we  move it later.
- Write some code
 <code>ForTheBirds.go</code>


<pre class=include-code>
path: someFile.cpp
highlight: c++
line-numbers:
line-highlight: 2-5, 10, 12
</pre>

<xmp highlight="Go" line-numbers="">
import (
    "net/http"
)

func root(w http.ResponseWriter, _ *http.Request) {
    w.WriteHeader(http.StatusOK)
    w.write("For The Birds - Pixar")
}

func main() {
    http.HandleFunc("/", root)
    http.ListenAndServe(":8080", nil)
}
</xmp>

<h3>Build</h3>
- Build your Code
<xmp highlight="bash">
docker run -v $(pwd):/go/bin --rm \
 golang go get github.com/golang/example/hello/...
</xmp>

- Write a docker build script

<xmp highlight="docker">
FROM scratch
 COPY ./hello /hello
</pre>
Lets leave the entrypoint out.

- Create an image

<xmp highlight="bash">
docker build
</xmp>

<h3>Test</h3>
- Run your image

<xmp>docker run </xmp>

- Test your service

<xmp>curl localhost:8080</xmp>
og du bør se teksten "For The Birds - Pixar".



<h3>Deploy</h3>


<h3>...</h3>






<h2>De enkelte platformsservices</h2>


For at kunne komme hurtigt igang og for at hurtigt at kunne efterprøve kunders behov, er der etableret en midlertidig selvbetjeningsløsninger på `k8s.govcloud.dk`. Løsningen er realiseret ved anvendelse af <a href="https://rancher.com/">Rancher</a>.

-   <a href="http://k8s.govcloud.dk"><code>k8s.govcloud.dk</code></a>  <small>version 1 - 20190201</small>

Her understøttes kunders deployment og monitorering af applikationer, samt deployment af services.

Det er planen at udvikle en simple og mere målrettet selvbetjening, der skal sikre større uafhængighed af den underliggende implementering, og tillade tilpasning af sprogbrug til fællesoffentlige begreber om it-systemer. Ansvaret for løsningen er stadig under diskussion.

-   <a href="http://cloud.gov.dk"><code>cloud.gov.dk</code></a>  <small>Endnu ikke planlagt</small>


I henhold til aftalen om GovCloud, skal den fulde lifecycle af tekniske services styres i fælles regi. Det vi sige at der løbende tages stilling til hvilke services der tilføjes og eventuelt udfases.

Følgende services er tilgængelig i GovCloud Platform API 1.0.

<h3>ID</h3>

Applikationer der ønsker at genkende brugere der allerede kendes af Statens IT, kan anvende platformens secure token service / billetomveksler. Kald til applikationsservice der er kræver en genkendt bruger vil få tilknyttet et <a href="https://jwt.io/">JSON Web Token</a> med oplysninger om brugerens identitet. Hvis der er brug for omveksling af identitetet mellem forskellige idp'er eller føderationer kan den interne secure token service anvendes.

-   <code>sts.govcloud.dk</code> <small>version 1 - 20190201</small>

<h3>Dataservice</h3>

Adgangskontrol til kunders datasæt styres på applikationsniveau og håndhæves af platformen. Dataservice lader applikationer skrive og læse datasæt gennem tre forskellige protokoller:

<a href="https://tools.ietf.org/html/rfc7530">Network Files System (NFS)</a> lader applikationer skrive og læse binære filer fra en lang række operativsystemer og programmeringssprog. Et datasæt repræsenteres af et NFS Directory.

-   <code>data.govcloud.dk:2049</code> <small>version 1 - 20190201</small>
    <!-- * `data.govcloud.dk/nfs` <small>Endnu ikke planlagt</small>-->

<a href="https://kafka.apache.org/">Apace Kafka</a> lader applikationer skrive og læse meddelelser til streams og topics. Et datasæt repræsenteres af en Kafka Stream.

-   <code>data.govcloud.dk:8082</code> <small>version 1 - 20190201</small>
    <!-- * `data.govcloud.dk/kafka` <small>Endnu ikke planlagt</small>-->

<a href="http://www.ojai.io">OJAI</a> lader applikationer at skrive og læse JSON dokumenter til dokumentsamlinger. Et datasæt repræsenteres af en OJAI Document Store.

-   <code>data.govcloud.dk:8243</code> <small>version 1 - 20190201</small>
    <!-- * `data.govcloud.dk/kafka` <small>Endnu ikke planlagt</small>-->

<h3>Log</h3>

Applikationers stdout/stderr, Service Fabric og Data Fabric sender loghændelser til en fælles log service. Log filer er tilgængelig i selvbetjeningsløsninger og for kundens applikationer via

-   <code>log.govcloud.dk</code> <small>TBD</small>
    <!-- * `data.govcloud.dk/log` <small>Endnu ikke planlagt</small>-->

<h3>Directory</h3>

Oplysninger om kundens services, applikationer, datasæt og deres rettigheder gemmes af selvbetjeningsløsningen i Directory servicen. Oplysningerne er tilgængelige for kundens applikationer via LDAP.

-   <code>ldap.govcloud.dk:349</code> <small>TBD</small>
    <!-- * `data.govcloud.dk/directory` <small>Endnu ikke planlagt</small>-->

External keys

Kunder der ønsker at begrænse anvendelsen af applikations services kan anvende eksterne nøgler (API keys). Eksterne nøgler giver ingen ekstra sikkerhed, men en mulighed for at begrænse eller identificere adgang ved fx misbrug.

-   <code>services.govcloud.dk/keyman</code> <small>version 1 - TBD</small>


Statens IT tilbyder - som supplement til GovCloud - en række sammenhængende services til brug for applikationsudvikling. På sigt vil en fuld DevOps proces kunne understøttes hos SIT, men indledningsvis tilbydes services til opbevaring af kildekode og docker container images.

<h3>Code repository</h3>

Kunder kan bringe deres applikationskode under versionskontrol i det fælles repository med authentication fra Statens ITs centrale brugerstyring.

-   <a href="http://git.govcloud.dk"><code>git.govcloud.dk</code></a> <small>version 1 - 20190201</small>

</h3>Container Image Repository</h3>

Kunder kan opbevare container images til deployment på GovCloud i det fælles repository med authentication fra Statens ITs centrale brugerstyring.

-   <a href="http://gitlab.govcloud.dk"><code>gitlab.govcloud.dk</code></a> <small>version 1 - 20190201</small>


<h3>...</h3>

# Examples of usage GovCloud PaaS

## Datadistribution

## Trusted Messaging

## Datascience/BI/Analytics

## Static Website

## RPA Robot Proces Automation

<img src="highlevel.svg" width="66%">
