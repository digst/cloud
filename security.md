<pre class='metadata'>
Title: cloud.gov.dk security
Status: LD
URL: https://github.com/digst/cloud/blob/master/security.md
Editor: Mads Hjorth, Digitaliseringsstyrelsen http://arkitektur.digst.dk
Boilerplate: table-of-contents no, copyright no, conformance no, abstract no
Markup Shorthands: biblio yes
Repository: digst/cloud
Inline Github Issues: full
</pre>
<h1>Sikkerhedsovervejelser<img src="cloud.svg" align="right">,<br> GovCloud PaaS,<br> Statens IT</h1>

<small>
Dette dokument er del af serie af dokumenter der beskriver et samarbejde mellem SIT, DIGST og DMI, som startede med en aftale om <a href="https://digst.github.io/cloud/start.html">GovCloud</a>. Serien består af en <a href="https://digst.github.io/cloud/intro.html">introduktion</a> (dette dokument), en detaljeret <a href="https://digst.github.io/cloud/spec.html"> specifikation</a> samt en <a href="https://digst.github.io/cloud/guide.html">guide</a> til applikationsudviklere.</small>
<br /><br />




<h2 class="no-num">Indledning</h2>



## Principper

Fra: https://cloud.oracle.com/cloud-security-compliance

Customer Isolation: Allow customers to deploy their application and data assets in an environment that is based on isolation from other tenants.

Data Encryption: Provide controls that can protect customer data at-rest and in-transit in a way that allows customers to meet their security and compliance requirements with respect to cryptographic algorithms and key management.

Security Controls: Offer customers effective and easy-to-use security management controls that allow them to manage access to their services and segregate operational responsibilities to help reduce risk associated with malicious and accidental user actions.

Visibility: Offer customers comprehensive log data that they can use to audit and monitor actions on their resources, to allow them to meet their audit requirements and help them reduce security and operational risk.

Hybrid Cloud: Enable customers to use their existing security assets, such as user accounts and policies, as well as third-party security solutions when accessing their cloud resources and securing their data and application assets in the cloud.

High Availability: Offer fault-tolerant data centers that enable high availability scale-out architectures and are resilient against network attacks, to provide consistent uptime in the face of disaster and security attack.

Verifiably Secure Infrastructure: Follow rigorous processes and security controls in all phases of cloud service development and operation. Demonstrate adherence to Oracle’s security standards through third-party audits, certifications, and attestations. Help customers demonstrate compliance readiness to internal security and compliance teams, their customers, auditors, and regulators.

## Designvalg

### Tenancy
Ikke bare kunde, men vi forbereder os på ressortomlægning, og er bevidst om forskelle i levetid. Så Services, Applikationer og Data er first-class citizens. Customer.



## Informationssikkerhed ISO 27001

### Retningslinjer for styring af informationssikkerhed (5.1)
Politikker for informationssikkerhed for services, applikationer og data fastlægges af ledelsen hos den enkelte platforms-anvender.

Ledelsen hos platforms-udbyder fastlægger politikker for de enkelte services der udgør cloud-api og dens selvbetjening. (Krav fra forretningsstrategi), legal og threat. Afgrænsing i forhold til konkret platform. Tildeling af roller? Undtagelses-processer.

Gennemgåes i forbindelse med eksisterende DIGST review. (5.1.2)


### Organisering
RACI?

Liste aktiver:

- Aftaler?
- Software (Platform (deploy-process, configuration)
- Software (Applikationer)
- Data (bruger-rettigheder, alle logs)

Leverandørstyring

Håndtering af applikationsudvikling, sker gennem DIGST review?

### Medarbejdersikkerhed
Særlige krav til platforms-operatør?
Ingen særlige krav til eksterne udviklere. Omfattet af eksisterende processer.


### Styring af aktiver.
Directory udgør fortegnelse over services, applikationer og data som beskrevet af platforms-anvendere.
Platforms-services, applikationer og data beskrives samme sted af Platforms-leverandør.

Særligt: oprindelse, behandling (anvendelse?), lagring, videregivelse, sletning og destruktion.

### Mediehåndtering (8).
Samme som generel politik. Flytbare medier på server er begrænset af fysisk adgang.

### Adgangsstyring (9)
Administration, Business and Citizen. Specfikke bruger-roller.
- Cloud-consumer-admin. Cloud-consumer-devops. (Per aktiv?)
- Cloud-provider. Service Fabric DevOps, Application Fabric DevOps,  Data Fabric DevOps. Customer-relation (Can you see what I see)?

### Kryptografi (10)
Nøgler til sikring af services og data-at-rest håndteres som udgangspunkt af SIT.

### Fysisk sikring (11)
Som andet.

### Driftssikkerhed (12)
Som andet. Ændringsstyring -> Service Life Cycle Management. Capacity planing i product board. Malware i Repository scan (ekstern netværksovervågning).

SIT Sikrer evidens (overveje kryptografisk sikring af log og tidstempler)

DevOps log på Applikationer.
DevOps log på Platform.

### Kommunikationssikkerhed (13)
Som andet. Inkl databehandler-aftaler.

### DevOps (14)

### Leverandørforhold (15)
Platform middleware og logs?

### Sikkerhedsbrud (16)
Som andet?

### Beredskab (17)
Applikation skal vurderes efter kritikalitet af platforms-anvender. Måske bare prioritering.

### Compliance (18)
Kan SIT? Eller er det kun lovgivende myndighed?


- Gældende lovgivning (også EU)
  - Immaterielle rettigheder (??)
  - Privacy (GDPR, Datalov)
  - Kryptografi (lov?)
  - Kritisk infrastruktur. Cybersikkerhed?

- Gældende aftaler
  - Fællesoffentlig Digital Arkitektur (Principper i hvidbog?, Erklæret i forhold til referencearkitekturer)

## Cybersecurity


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
