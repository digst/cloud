# ![logo](cloud.svg) Startarkitektur <br> GovCloud PaaS<br> Statens IT

Dette dokument beskriver en arkitektur for et projekt med henblik på at etablere en fællesoffentlig udviklings- og drifts-platform hos Statens IT. Platformen anvender teknologier kendt fra 'cloud' til at understøtte 'continious delivery' og 'agile development'.

Projektet er baseret på erfaringer fra DMI, SIT og DIGST, der i sommeren 2018 gennemførte et 'proof of concept' for distribution af meterologiske observationer og vejrudsigter. Projektet har også til hensigt at etablere en 'best practices' til at understøtte et muligt fællesoffentlig princip om 'cloud first' it-udvikling.


## Målsætninger
Projektets deltagere har følgende overordnede målsætninger (her udtrykt som user stories):

- Som anvender af platformen vil DMI have højest mulige oppetid for mine applikationer.
- Som applikationsudvikler ønsker DMI at kunne teste og idriftsætte nye version hurtigst muligt.
- Som udbyder af platformen vil SIT have mulighed for at udskifte produkter i platformen med mindst mulig påvirkning af mine kunder.
- Som udbyder af platformen vil SIT at kunne udvide platformen med flere applikationer uden at platformen koster væsentligt flere ressourcer.
- Som ansvarlig for den fælles offentlige digitalilseringsstrategi vil DISGT have mere sammenhægnende, sikre og effektive it-anvendelser.

## Principper
Ovenstående målsætninger kan generaliseres til principper der kan styre udviklingen af platformen - også udover udviklingen af de første applikationer:

**Uafbrudte services**: GovCloud platformen og dens applikationer er bygget med henblik på uafbrudt service både under opdagtering af enkelte services og hele platformen.

**Leverandøruafhængighed**: Applikationer og data skal effektivt kunne flyttes fra en cloud platform til en anden.

**Skalérbar platform**: Forvaltning, support og komponenter skal kunne håndtere mange applikationer med begrænset tilføjelse ressourcer.

**Security-by-design**: Platformen er designet på en måde der sikre applikationer høj informationssikkerhed.

**Omkostningssikker**: Platformens driftsmodel skal sikre at kunders omkostninger til platformen er forudsigelige.

## Design
Startarkitekturen består af en række designbeslutninger til brug for afgrænsning og konkretisering af projekteter. I forbindelse med den konkrete etablering kan beslutningerne ændres med deltagernes accept.

**[PaaS]** GovCloud platformen udbydes af SIT under 'Driftsmodel 2: Platformservice' med nedenstående tilpasninger.


**[1. Service Lifecycle]** GovCloud platformen er under kontinuerlig udvikling, der styres af et anvenderforum ledet af DIGST.

**[2. Service Operation]** Driften af GovCloud platformen og alle dens applikationer understøttes af en udvidet vagtordning (24/7).

**[3. Middleware]** GovCloud platformen består af følgende middleware: MapR, Kubernetes og KrakenD.

<br>
Udover ovenstående beslutninger vedrørende driften af platformen, er der også besluttet følgende:

**[Toolchain]** SIT tilbyder en samling intergrerede værktøj til applikationsudvikling  på 'Driftsmodel 1: Applikationsservice' bestående af Jira, Confluence, Git, Jenkins, Soap UI.

**[DevOps]** DIGST sikrer at der findes kurser i anvendelse de valgte værktøj og tilbyder rådgivning og review af design af applikationer på GovCloud platformen.

<br>
<div align=right style="font-style: italic;">/madsh@digst.dk, 20181008</div>
