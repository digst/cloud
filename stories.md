<pre class='metadata'>
Title: cloud.gov.dk user stories
Date: 2018-10-29
Shortname: start
Status: LD
Group: govcloud
URL: http://github.com/digst/cloud/start.md
Editor: madsh@digst.dk, Digitaliseringsstyrelsen http://digst.dk
Boilerplate: table-of-contents no, copyright no, conformance no, abstract no, index no, idl-index no
No Abstract: true
</pre>

<h1>User Stories <br> GovCloud PaaS <br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en række <a href="https://digst.github.io/cloud/stories.html">users  stories</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>

Dette dokument beskriver arbejdet med user stories til brug ved udviklingen af en cloud-baseret fælles udviklings- og driftsplatform hos Statens IT til brug for statslige institutioner. De konkrete user stories registreres i et <a href="https://digst.github.io/cloud/userstories.xlsx">vedlagt excel ark</a>. Herunder beskrives arkets struktur og anvendte begreber.

Hver række i regnearket beskriver en user story. De første kolonner indeholder oplysning der identificere den enkelte story, de øvrige kolonner indeholder accept kritierier knytter til forskellige elementer af løsningen.

Vigtigst er nok, at user stories <i>ikke</i> er en krav specifikation. Nogle kalder dem "et løfte om en samtale" - altså noget de forskellige parter skal huske hinanden på at tale om undervejs i forløbet. Acceptkriterier er <i>ikke</i> en detaljeret specfikation. Der er nærmere "noter om hvad arbejdet med en user story bør indeholde".

## Aktører og roller
Beskrivelsen anvender tre roller til at beskrive ønsker og hensyn for hver af de nuværende aktører. DMI har rollen som <a href="https://digst.github.io/cloud/spec.html#platformsanvender">anvender</a> af platformen, SIT rollen som <a href="https://digst.github.io/cloud/spec.html">udbyder</a> af platformen og DIGST rollen som <a href="https://digst.github.io/cloud/spec.html">politik ansvarlig</a> for it-udvikling i staten. Når platformen tages i fuld drift vil alle kunder hos SIT også have rollen som anvender. På det tidspunkt vil det nok være relevant at anvende den konkrete aktør som ejer på en user stories, men da vi kun har en anvender nu, vælger vi at holde os til roller.

Roller registreres i en særskilt kolonne for hver user story i regnearket. På den måde kan arket fokuseres på en enkelt rolles stories.

## User Stories
Ifølge wikipedia er <a href="https://en.wikipedia.org/wiki/User_story">user stories</a> en uformel beskrivelse af en eller flere feature/funktion i en it-løsning. Her vælger vi en skabelon for user stories for at sikre ensartetheden, men det kan sagtens afviges for at sikre et mere naturligt sprog. <xmp>Som  <rolle> ønsker jeg  <at kunne gøre>, så jeg <kan opnå>.</xmp>

Hver user storie har én aktør som har ansvaret for beskrivelse og en vurdering af opfyldelsen i den aktuelle situation.

En user story er én række i regnearket. Og knyttes til én rolle i en særkilt kolonne.


## Epics
Der er brug for at organisere de mange user stories. Epics er en gruppe af user stories som har noget til fælles. Der er ingen udbredt enighed om betydning af et epic. Her har vi forsøgt at gruppere dem i forhold til hvilke <a href="./spec.html#roller-og-omrder-for-samarbejde">områder for samarbejde</a> de knytter sig til. En ambition kan være at lade en epic indeholde alle de nødvendige features så færdiggørelsen vil give en konkret værdi for alle aktører.

Epics registreres i en særskilt kolonne per user story.

## Elementer af løsningen
Kollonerne til højre repræsentere elementer af løsningen som beskrevet i <a href="spec.html"> specifikationen</a>.

De første (lyserøde) er papirprodukter, altså leverenace fra projektet i form af godkendte dokumenter. (er ikke beskrevet i spec.html lige nu men bruge måske? paperbased SBB!)

De næste (grønne) er platformen services som anvendes af mennesker og er tilgængelig i en browser på en internetadresse. Eller platform api'en som er services der anvendes af applikationer.

De sidste (hvide) er fabrics (elementer af platformen) med ansvar for andre af platformens funktioner.


## Accept kritierier
Som sagt; accept kriterier er noter om hvad arbejdet med en user story bør omfatte.

Den rolle (bruger) som er indgår i user storien har til opgave at forklare så tydeligt som muligt hvad de ønsker og med hvilket formål. Det indfanges i beskrivelsen af user story. Samtidig vurderer leverandøren/projektet hvilke elementer af løsningen der skal i spil for at løse behovet bedst muligt. Gradvist bør der opstå en fælles forståelse for hvordan behovet opfyldes. Formålet er <i>ikke</i> at indsamle alle detaljer om hvordan behovet opfyldes, men alene sikre projekt enighed om hvilke rammer der er for løsningen. Behovet opfyldes først når løsningens elementer er leveret i en version der lever op til acceptkriterierne.

Begrebet er tæt knyttet til samme term indenfor software test. Her indeholder en test case acceptance criterier. Bemærk at formålet med use cases er et andet.

Acceptkritierier skrives i kollonen for løsningens element og i den række hvor den er mest relevant. Det er ikke nødvendigt at kopiere kriterier på tværs af flere stories. Regnearket kan fokuseres så man kun ser de user stories som er relevante for et enkelt løsningselement.


## Status (-vurdering til styregruppe)
Agile udviklingen betyder ikke fravær af styring - tværtimod. Projektet har brug for at rapporter fremdrift og bringe uklarheder eller problemer til styregrupper. Et traiklys-status felt anvendes til dette.

Status er vurdering af hvilke opmærksomhed en user story bør have på et kommende styregruppemøde.

Betydningen af trafiklysets farver er som følger:

* <strong>Grøn</strong> User storien er velforstået og accepteret af projektets parter. Den kræver ikke særlig opmærksomhed fra styregruppen. Det betyder <i>ikke</i> at elementet i løsninge er leveret, klar til afprøvning eller godkendt.

* <strong>Gul</strong> User storyen er identificeret og accepteret af projektet parter. Der er uklarhed om løsningen på behov og/eller om acceptkriterierne er tilstrækkeligt. Den kræver at styregruppen orienteres om hvad planen er for at bringe den til grøn. Orientering sker af user storys rolle dvs den part som har behovet, og dermed også størst incitament og mulighed for at afklare.

* <strong>Rød</strong> User storyen er identificeret men det vurderes at løsningen ikke kan tilvejebringes uden beslutning om ændringer fra styregruppens side. Styregruppen bør orienteres om årsagen til status og måske findes der en indstilling til hvordan problemet løses. Indstillinger foreslår typiske at:
  *  Flytte user story til en senere planlagt epic.
  *  Tilføje flere ressourcer til arbejdet.
  *  Ændringer i den foreslåede løsning (reduktion af scope, foreslå nemmere løsning af behov eller andet),
