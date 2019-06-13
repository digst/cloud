<pre class='metadata'>
Title: cloud.gov.dk tools
Status: LD
URL: http://github.com/digst/cloud/tools.md
Editor: Mads Hjorth, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Abstract: Beskrivelse af implementeringen af GovCloud ToolChain SaaS.
Boilerplate: copyright no, conformance no, Abstract no
Shortname: spec
Markup Shorthands: markdown yes
Repository: digst/cloud
Inline Github Issues: full
Logo: https://digst.github.io/cloud/cloud.svg
</pre>

<h1>Specifikation <br> GovCloud DevTools SaaS <br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>


<h2 class="no-num">Introduction</h2>




## Epics and User Stories
[bør nok flyttes til JIRA issues på et tidspunkt...]

For at fastholde og prioritere forskellige ønsker under udviklingen, anvender vi epics og user stories. I første omgang er aktørerne (Applikations-)udvikler/Anvender, (Platforms)-operatør/Udbyder  og Policy Owner?  Auditor?







### Application Development and Operation
Note: Overvej at bruge DevOps fase model som illustration.

Ikke alle funktioner er understøttet af platformen i sig selv, nogle gør brug af et andet produkt fra platformsudbyder, nemlig DevOps ToolChain.

Når epic'en er færdig kan en udvikler push'e en container til et repository på platformen, re-deploye en applikation, dens log, samt styre rettigheder til services og datasæt.

Deploy, Operate og Monitor understøttes af platformen (se Specifikation GovCloud PaaS Statens IT.).

#### Plan
Når epic'en er færdig kan en kunde og en udvikler samarbejde om udarbejdelsen af epics, user stories, start arkitektur og andet i værktøj der kører på platformen. (Jira, Confluence)

* 1.1 Som kunde vil jeg gerne kunne beskrive epics og user stories i JIRA.

* 1.2 Som kunde og udvikler vil jeg gerne kunne beskrive en start arkitektur i Confluence applikationer, container, services og datasæt.

* 1.3 Som udvikler vil jeg gerne kunne relatere kode checkins til user stories.


#### Build
Når epic'en er færdig kan en udvikler checke kode ind og bygge en container baseret på et basis image fra SIT.

* 2.1 Som udvikler vil jeg gerne kunne gemme og versionstyre min applikationskode og konfiguration, så jeg effektivt kan rette fejl og samarbejde med andre udviklere (Git)

* 2.2 Som udvikler vil gerne kunne bygge en container og placere den på et repository, så den kan flyttes ind på platformen af operatøren når jeg beder om det (Docker, Harbor)

* 2.3 Som udvikler vil gerne have adgang til data på platformen direkte fra mit udviklingsmiljø, så jeg nemt og hurtigt kan afprøve nye funktionalitet i min applikation (Kubernetes?)

[baseimages?]

* 2.4 Som operatør vil jeg gerne kunne udgive et base image til brug for udviklere, så jeg på sigt kan overtage ansvaret for at opdatere de dele af applikationer der er fælles fx en java platform (Harbor)

* 2.5 Som udvikler vil jeg gerne kunne sætte et automatisk bygge forløb op, der starter når jeg checker kode ind, så jeg effektivt kan bygge containere (Git, Maven?)

#### Test?
Når epic'en er færdig kan en udvikler eller en operatør teste en containers funktionalitet med en række automatiske testcases.

[no baseimages?]

* 3.1 Som udvikler vil jeg gerne kunne vedlige holde scripts, data og stubbe til automatisk test af en containers funktionalitet. (Git, SoapUI/JMeter/Postman?)

* 3.2 Som udvikler og operatør vil jeg gerne kunne gennemfører automatiske test af en containers funktionalitet (??)
