# FællesOffentlig ReferenceArkitketur (FORA)

en opsummering af eksisterende referencearkitekturer med fornyet forkus på sikkerhed. Vægt på at beskrive eksisterende kendte mønstre, deres fordele og ulemper, samt hvilke områder det er vigtigt at standardisere/regulerer/aftale.



## Indledning

- Formål, anvendelse og målgruppe
- Scope
- Centrale begreber
- Tilblivelse og governance
- Anvendt metode, notation og signsturforklsring
- Releation til rammearkitektur og andre referencearkitekturer
- Læsevejledning


## Juridiske rammer....
**Udvid med cybersecurity og ny krigsregel**

Ridse de vigtigste principper op.

- Der er forskel på persondata og ikke persondata.
- Data kan være kristiske og følsomme
- Sikkerhed og privacy

GDPR, NIS?, PSI og eIDAS.


## Strategi

- Forretningsmæssige tendenser
  - Regulering af datadeling GDPR, PSI mm
- Teknologiske tendenser
- Vision:  ***Sammenhængende, sikker og effektiv*** 

Brugerorienteret, tværgående, beskyttet, privacy, cost og process...

Beskriv at vi holder os til det tværgående, men at lokal risiko vurdering kan overse det fællesoffentlige. Derfor må vi også kigge på de lokale processer og tjenester der understøtter visionen.

- Forretningsmæssige mål
- Strategiske principper
- Værdiskabelse
- Sikkerhed?


## Forretningsarkitektur
- Opgaver, aktører, roller og ansvar
- Tværgående processer.
- Forretningsfunktioner
- Tjenester og Forretningsobjekter.

(tillidstjenester og basisregistre findes i hver af nedenstående)

### Brugerstyring
Borger/Virksomheder (Controlled -> Federated)
Ansatte i myndigheder (Normativt -> Federated)

### Selvbetjening
Normative -> Controlled (særligt mit overblik/tværgående brugeroplevelser)
          -> Subsidiary (Kommuner vil selv)
          -> Federated (Regioner)

### Deling af data og dokumenter
Normativt -> Controlled (persondata og grunddata)
          -> Normativ (PSI)



### Forvaltning af Services, Application og Data
(Subsidiary -> Normative)
<hr>



### Regulatory and Implementation Scenarios

- Controlled Scenario
- Normative Scenario
- Federsted Scenario
- Subsidiary Scenario


## Teknik
- Nødvendige applikationsservices
- Foretrukne Implementeringsmønstre (anvendelse af infrastruktur) Raul?
- Understøttende services
- Områder for standardisering
