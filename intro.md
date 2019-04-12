<pre class='metadata'>
Title: cloud.gov.dk introduktion
Status: LD
URL: https://github.com/digst/cloud/blob/master/intro.md
Editor: Mads Hjorth, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Boilerplate: table-of-contents no, copyright no, conformance no, abstract no
Markup Shorthands: biblio yes
Repository: digst/cloud
Inline Github Issues: full
</pre>
<h1>Introduktion<img src="cloud.svg" align="right">,<br> GovCloud PaaS,<br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>


[Målgruppe: Direktioner i statslige styrelser og ministerier.
Formåæl: fokus på it-styring, paradigmeskift Cloud Native/First , begreber om styring og cloud,  ]



<h2 class="no-num">Indledning</h2>
Danmark er et digitalt samfund med høje ambitioner for sammenhængende services for borgere og virksomheder og ambitionerne løftes endnu engang med Regeringens Sammenhængsreforms delaftale om <a href="">Digital service i verdensklasse</a>.

I dag tilbydes mange offentlige services af enkelte myndigheder og er sjældent integreret i de sammenhængende brugeroplevelser som er en del af ambitionen. Selvom Digitaliseringsstrategiens initiativer peger i den rigtige retning oplever flere myndigheder at tilvejebringelsen af nye løsninger tager uforholdsmæssigt lang tid, særligt når flere myndigheder involveres. Leverandører og enkelte myndigheder har gode erfaringer med nedbringe tiden ved at bruge moderne udviklingsmetoder og cloud-teknologier.

En fælles cloud-baseret platform er en måde at bringe nye metoder og teknologier i spil på, der tilbyder en ny sikker og mere effektiv platform for en ny generation af offentlige it-systemer.

Statens ITs beslutning om at tilbyde en ny driftsmodel, bringer ét skridt tættere på at kunne opfylde de høje digitale ambitioner.

Nuværende niveau for offentlig IT har væsentlige mangler

  - usammenhængende services leveret i siloer
  - ineffektiv datadeling koster og hæmmer effektiv, data-drevet styring
  - utilstrækkelig sikkerhed til at imødekomme ny trusler

Cloud-teknologier har uforløste potentialer

  - moderne drift er ved lave omkostninger og høj skalerbarhed
  - dev-ops giver effektiv udvikling, test og deployment
  - scale out til public cloud ved behov

Fælles platform giver nye muligheder

  - bedre overblik over værdier i form af data og applikationer
  - lettere genbrug af data i nye sammenhænge
  - effektiv udnyttelse af ressourcer på tværs af myndigheder

<h2 class="no-num">Moderne IT forvaltning</h2>

Systemforvaltning... giver problemer...
Forvaltning af værdier (assest management)... i form af

Cloud teknologi som enabler, by design. Men det skal styres gennem arkitektur, vedor login.

Figur.

<h2 class="no-num">Cloud</h2>
Plank NIST side 1,
Ordet cloud er blevet del af dagligdagssproget for mange og dækker over alt lige fra "just someone else's computer" til datacentre der bruger over en tiendedel af den samlede danske el-produktion. Her anvender vi markedets mest udbredte betydning som den kan findes hos det amerikanske National Institute of Standards and Technologies. De har udgivet en kort og præcis beskrivelse af en række begreber omkring cloud computing services.

<blockquote cite="">This cloud model is composed of five essential characteristics (On-demand self-service, Broad network access, Resource pooling, Rapid elasticity, Measured service), three service models (Software as a Service, Platform as a Service, Infrastructure as Services), and four deployment models (Private, Community, Public, Hybrid).<footer><cite>[[NIST.SP.800-145]]</cite></footer></blockquote>

Cloud modellens succes skyldes i følge NIST øget <q>developer agility and attractive (initial) cost</q>.

Nye roller:
  - Cloudconsumer = Statslige organisationer, DIG!
  - Cloudprovider = ??
  - Audit, Broker og Carrier... er lidt uden for scope lige nu...



<h2 class="no-num">DIGST policy</h2>
eksisterende...Sammenhængende sikre og effektive services..

Strategi: Anvendere ønsker at fokusere på den forretningsnære del af it-udviklingen. Fra IaaS til PaaS. FDA, siger brugerstyring, selvbetjening og datadistribution.

Strategi: Compliance by design. Samle mange krav til én vejledning.

Strategi: Effektiv implementering gennem central løsning med exit.

Strategi: Styre på snitfladen mellem platform og applikation. Definition af platform services...

Rolle:
  - Myndighed
  - borger og virksomheder
  - Policy owner
plus en ny?

Policy på GovCloud, Digst tror på..... Statslig regi... PaaS... Community Cloud.

Mulighed for at styre noget arkitektur på stålet...

Statens ITs nye driftsmodel er et fælles offentligt udviklings- og driftsmiljø tilbudt som Platform as a Service. I første omgang alene som en 'on-premise' Community Cloud, men forventes udvidet til en Hybrid Cloud med anvendelse af andre Public Cloud og SIT i rollen som Cloud Broker. [[NIST.SP.500‐291]]

<h2 class="no-num">GovCloud PaaS</h2>
Formålet ... Compliance by design! og hyppig, effektiv udbredelse...på til harmoniserede services..

Placering af roller...
SIT bliver...
DIGT bliver...
Myndighede bliver cloudconsumers
Borger og virksomheder er busines service consumers

<h2 class="no-num">Behov og der opfyldelse</h2>

- Anvendere ønsker mere fleksibel og billigere adgang til it-ressourcer - Self-service, measured service (), ressource pooling og fælles indkøb, leverandør kendskab.

- Anvendere ønsker at kunne teste og idriftsætte nye versioner hurtigst muligt. - Self-service,

- Anvender ønsker sig sikkerhed for compliance... - policy understøttelse
  - Sikkerheds (ISO27001)
  - Privacy GDPR
  - FDA principles supported/enforces by a layered architecture/seperation of conserns. Seperate functionality to manage user, share data and provide self-service from core business applications

- Anvender ønsker sig indflydele på platformens udvikling. - Fælles offentlig governance

- Anvender ønsker sig en fremtidssikring af løsninger... - Effektivt understøtte emerging principper som once-only, open by default, single digital gateway, reusable infrastructure... government data platform/datastrategi.

<h2 class="no-num">Mulige gevinster</h2>


<h2 class="no-num">Anvarsfordeling</h2>
PaaS beskriver ansvarsfordelinger:

Kunden får mulighed for at deploye egne applikationer der er udviklet med brug af programmeringssprog, services og værktøj der understøttes af SIT.

Kunden har ingen kontrol over den underlæggende infrastruktur, herunder network, serverer, operativsystemer og storage. Men tilgengæld over egne applikationer og deres konfigurationer.

Ansvarsfordelingen mellem platform og applikationer er flydende. Men forsøges fastlagt ....


GovCloud API aftales mellem kunder, SIT og DIGST som policy owner (own definition).



<h3 class="no-num">Myndighedens it-system(er)</h3>

<h4 class="no-num">Service</h4>
An Application Service represents an explicitly defined exposed application behaviour.

Eksempel: CPR opslag, Send Digital Post, Website

Rette mod Borger og Virksomheder (herunder andre myndigheder).



<h4 class="no-num">Applikation</h4>
An Application represents an encapsulation of application (business!) functionality

Process understøttelse.. hvor der også indgår borger og virksomhed, kun gennem services..

Minus data.

Eksempel: F2, Datafordeler, NemID,


Komponent unit of scalability

<h4 class="no-num">Datasamling</h4>

Eksempel: CVR register, HR Sager,


<h3 class="no-num">Statens ITs platform</h3>

<h4 class="no-num">Selvbetjening</h4>

<h4 class="no-num">Application Fabric</h4>

<h4 class="no-num">Data Fabric</h4>

<h4 class="no-num">Platform Services</h4>



<h3 class="no-num">Digitaliseringsstyrelsen</h3>

<h4 class="no-num">Roadmap for Platform Services</h4>

<h4 class="no-num">Vejledning i anvendelse</h4>


<pre class=biblio>
 {
 	"NIST.SP.800-145": {
 		"authors": [
 			"Peter Mell",
 			"Timothy Grance"
 		],
 		"href": "https://doi.org/10.6028/NIST.SP.800-145",
 		"title": "The NIST Definition of Cloud Computing",
 		"publisher": "National Institute of Standards and Technologies"
 	}
 }


{
 "NIST.SP.500-292": {
   "authors": [
   "Fang Liu", "Jin Tong", "Jian Mao", "Robert Bohn",
"John Messina", "Lee Badger2, "Dawn Leaf"
   ],
   "href": "https://doi.org/10.6028/NIST.SP.500-292",
   "title": "NIST Cloud Computing Reference Architecture",
   "publisher": "National Institute of Standards and Technologies"
 }
}

 </pre>
