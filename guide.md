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


### Connecting to sandbox MapR


1. Information from SIT.

govsit.dk : Kafka 8082 (REST) 8083 (Connect)
