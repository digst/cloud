<pre class='metadata'>
Title: cloud.gov.dk start-arkitektur - opklaring
Date: 2019-04-04
Shortname: clarify
Status: LD
Group: govcloud
URL: http://github.com/digst/cloud/clarify.md
Editor: madsh@digst.dk, Digitaliseringsstyrelsen http://digst.dk
Boilerplate: table-of-contents no, copyright no, conformance no, abstract no, index no, idl-index no
Markup Shorthands: markdown yes
No Abstract: true
</pre>



<h1>Noter om start-arkitektur <br> GovCloud Paas <br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består desuden af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a>, en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>

<i>I slutningen af oktober 2018 besluttede DMI, SIT og DIGST bl.a. at "Statens IT etablerer en GovCloud-platform baseret på afprøvningsprojektet, således at GovCloud-platformen er klar til service- og applikationsudvikling senest 1. januar 2019 og er klar til drift af applikationer senest 1. juli 2019." Som en del af beslutningsgrundlaget indgik en start-arkitektur for projektet.</i>

Start-arkitektur belv besluttet i en kontekst, hvor det var vigtigt at opnå enighed. Senere har det vist sig at flere formulering kan fortolkes - og bliver fortolket - på forskellige måder. Dette dokument forsøger at fastholde de originale intentioner bag formuleringerne. Dokumenter kan fungere som bidrag til SITs udformning af den endelige Service Model for GovCloud PaaS.

Der udestår t0 vigtige afklaringer før DMI, SIT og DIGST kan opnå enighed om en kommende Service Model:

- **Multi-tenancy** eller hvordan sikkerheds- og ressourcemæssige-afgrænsinger mellem kunder og applikationer understøttes på platformen,  herunder implementeringen af *fair use* med mindst mulig forvaltningsbyrde. DIGST foreslår der udarbejdes et selvstændigt notat om dette, samt at den nuværende specifkation udvides på baggrund af NIST Cloud Security model.

- **Monitorering af applikationsservices** Det er uklart hvordan ansvaret for overvågning og reaktion ved nedbrud bedst fordeles mellem platformsanvender og platformsejer. DIGST foreslå at der først aftales en konkret proces for hvordan de forskellige aktører skal inddrages ved nedbrud af applikationsservices, og der dernæst udpeges passe værktøjer til it-understøttelse af denne.


Her følger en kort baggrund til hver af de modtagede kommentarer fra SIT:


1. *Agil it-udvikling* SIT ønsker at fremhæve DevOps hos kunderne. Ordet agil er anvendt for at beskrive at det vigtigt for  platformsanvenderens (forretnings)-agilitet at platformen er bygget til at understøtte DevOps og Contiuous Delivery.

2. *Driftsmodel* SIT ønsker at anvende begrebet Service Model istedet. Driftsmodel er alene valgt for at henvise til SITs på det tidspunkt foretrukne modeller. SITs Service Model begreb erstatter driftmodeller, som ikke længere bør refereres fra GovCloud arbejdet.

3. *Service Lifecycle* SIT peger på at platformen kan styres gennem eksisterende eller kommende fora, fremfor at have eget styringsparadigme. DIGST der er enige. Den fremtidige governance skal nærmere aftales og DIGST ser muligheder for at lade GovCloud indgå i en fællesoffentlig styring af infrastruktur.

4. *Middleware* SIT påpeger at begrebet middleware har en anderledes betydning hos dem. Intentionen er at Service Lifecycle omhandler den del af GovCloud der er synlig for anvendere, enten i form af selvbetjening eller i form af tekniske service til brug for applikationer (CloudAPI). SIT tilvejebringer CloudAPIen ved brug af software, og har efter ibrugtagning  mandat til at vælge produkter, så længe de opfylder den aftale specifikation af CloudAPIen.

5. *Fair use* skal sikre effektiv udnyttelse af delte ressourcer, uden at en enkelt platformsanvender eller dennes brugere ligger beslag på andre anvenderes ressourcer. Der udestår en afklaring af hvordan fair use reguleres. For platformsudbyderen er det vigtigt at begrænse services brug af network, applikationer brug af processor og kunders brug af storage i form af datasæt. Desuden er det vigtigt for platformsanvender at kunne begrænse brugeres brug af ressourcer ved uhensigtmæssige anvendelser. Endelig findes der endnu ikke et datagrundlag for at vurdere betydningen af in-effektiv applikationskode og/eller uhensigtsmæssige anvendelse af service på platformen.

6. *Service Operation* Der enighed om at en fuld 24/7 support af applikationer kræver involvering af både platformsudbyder og platformsanvender. SIT mener ikke de kan påtage sig det fulde ansvar for overvågning af applikationer, men kan godt se en mulighed for at udbyde services til brug i overvågning. Der er enighed om at SIT principielt ikke kan eller bør ændrer i indholdet af applikationscontainere.

7. *Idriftsættelse* Afsnittet omhandler to processer. Dels SITs ændringer på platformen, dels platformsanvenderens ændringer i applikationer. Platformsanvenderen forventer at sætter applikationer i drift via selvbetjeningsløsningen og fuldt automatiske processer, og at ændringer på platformen rulles ud hyppigt, uden at brug af service vinduer (Continuous Service).

8. *Developer Toolchain* SIT og DIGST ønsker at udbyde en samling værktøjer til DevOps og detilhørende uddannelse. Værktøjerne er valgfrie at benytte for platformsanvendere. DIGST vurdere at det er hensigtmæssigt at det gøres obligatorisk at anvende platformens repositories til opbevaring af kode og container images. Dette vil sikre direkte adgang til det anskaffede, samt give mulighed for på sigt at tilbyde automatisk scanning med henblik på at opdage kendte usikkerheder (Vulnerability Scan).

<div align="right" class="font-style: italic;">/DIGST 2018-4947</div>
