

# Initial Architecture <br> Government Cloud <br> Statens IT

This document is an initial architecture for a project aiming at establishing the first version of a new operations model at Statens IT based on cloud technologies and supporting agile development processes. The architecture describes which decisions that has been made and why, for selected elements in a reference model.  Decisions reflects the needs identified by first know applications and supports a longer strategic perspective on use of cloud technologies in the danish public sector.

Edited in September 2018 by [Mads Hjorth](mailto:madsh@digst.dk), Digitaliseringsstyrelsen.


| Date    | Version  | Usages
|-------- |--------- | --------------------------------------------------------
| 20180903|      0.1 | Used for first workshop 20180906
| 20180911|      0.2 | Used for second workshop 20180912
| **20180914**| **0.7** | Internally reviewed, used 201809119
| 20180920| 0.9 | Distribute for meeting 20180924
| 20180926| 1.0 | Distribute for meeting 20181003


## Executive Summary
pre-condition: inter organisational agreement and in competition with public cloud

Principles, Continious service availabilty, Vendor Neutral

DIGST shall in the role of Government Cloud Policy owner:

 - In corporation with SIT establish a forum for service lifecycle decisions on the platform and toolchain
 - In corporation with SIT provide access to guides, training and courses for existing and prospective users of the GovCloud on using the platform and toolchain.

SIT shall in the role of GovCloud provider:

 - Establish an operating model for GovCloud with suporting processes that includes 24/7 support on operation, rolling updates of platform and application servicemonitoring.
 - Operate a GovClud as a PaaS using MapR, Kubernetes, Docker and KrakenD on premise.
 - Provide a DevOps toolchain, including a virtual machine image for seperate build and test, as SaaS.

 - Provide collaboration tools for incident management with users and required technology providers.

 - Integrated platform, toolchain and collaboration tools with exsiting AD.

 - Operate a platform service for API management and rate limiting

 - Provide a sandbox environment for prospective users of the platform and toolchain


 DMI and DIGST shall in the role of GovCloud consumer:

 - Develop, deploy and operate application services, including automated test criteria.

 - Use the virtual machine image provided by SIT for build and test.

 - Establish collaboration processes for 24/7 support.

 - Establish processes for onboarding data/service consumers.

 - Provides estimates to SIT for capacity planing.


## Introduction
[rewrite] GovCloud ideas have been around for years, and in the spring of 2018 the planets alligned in a way that allowed a small group of people to conceptualize the idea. Digitaliseringsstyrelsen initiated a coolaboration between the Danish Meteorological Institute and Statens IT that lead to this architecture.

[DMI intro]

The purpose of Statens IT (SIT, eng. [Danish Agency for Governmental IT Services](https://statens-it.dk/english/)) is to provide the Danish Governement better, safer, and more cost-efficient it operation and service to the Danish Government. SIT has focus on accessibility, stability, efficiency and information security in four main areas of operation: personal computers for state employees, it infrastructure, standardisation of generic administrative it and standarised vendor contracts.  Currently SIT services 12 of 19 ministeries totalling 17.000 employees at 250 physical locations, and is scheduled to expand to more ministeries for a total of 35.000 employes. At this point, The Ministery of Defense, The Police and The Tax Authorities will then be the only areas with seperate it operations.

Digitaliseringsstyrelsen (DIGST, eng. [Agency for Digitisation](https://en.digst.dk/)) was established in 2011 with joint public funding. Its purpose is to create and implement initiatives and policies regarding the digitalisation of the public sector. DIGST supports public sector efficency by providing digital services to citizens, businesses and government organisations. DIGST implements joint public projects and is hosts for The Danish Council for IT projects and the government it project model.

DIGST and SIT are both part of the Ministery of Finance and employes about 250 people each.

The Digital Strategy 2016-2020 is a joint public strategy for all levels of governement: state, regional and local. Among the many initiatives in the strategy to be supported by this architecture are *8.1 Good data and efficient data sharing* and *8.2 Robust operation of the common infrastructure*. During the realisation of the Digital Strategy it has become evident that public authorities on all levels of government struggle with a **time-to-market for new applications and integrations** that does not match the ambitions of integrated public service delivery, the ever-changing political and regulatory landscape and the  technological development in general.

Integrated in the The Digital Strategy is a joint public architecture framework (FDA, da. Fællesoffentlig Digital Arkitektur). Within the framework a number of reference architectures has been approved, especially the reference architecture for *sharing of data and documents* is relevant for this project. The GovCloud concept is an implementation of the pattern *shared data and application platform*.

## First Applications
Paramount to the establishment of a Government Cloud is the succesfull support of an intial large scale strategic project to prove the attractivness of the architecture.

It has been the focus of a proof of concept to create common experiences across different organisations, and this focus is continued in the initial version of the GovCloud. DMIs is an experienced application developer and service provider, and has supporting throughout all aspects of this design. DIGST has much experiences with policy development, whereas SIT has established mature it operations, but neither have experiences with agile application developement. Hence DIGST has choosen to also take the role of application developer in a smaller project and SIT will use the platform to build its own platform services.

As drivers for the initial version of GovCloud, the following applications has been choosen:

*DMI Data.* Meteorological and climate data are distributed widely today. As a consequence of the EU directive of Public Sector Information DMI is required to share a number of data sets free-of-charge to a potentially very large group of new data consumers. DMI sees a potential of seperating the generic operational aspects of data sharing from the knowledge and support of the specific data they produce.

In the future data sharing to both private consumers and other government organisations are expected to be done on the same infrastructure, whereas highly critical sharing e.g. crisis management and defense, will continue in seperate channels.

Experiences from countries with free-of-charge meterological data, have shown the need for a way to contact data consumers in the case of erroneous data from failing sensors etc.

*PubOrg.*
[Describe data to be shared, volume and latency]
[Describe few sources and first know usages]

*Platform DevOps.*
[Development of platform services]

Initial storage, compute and network estimates for first applications. Unreplicated data and external bandwith. All numbers are in giga bytes.

| Applications | Providers | Daily In       | Co. | Storage | Daily Out | Consumers |
| ---          | ---       | ---:     | ---:| ---:| --- | --- |
| Observations | DMI       | 1        | -  | 1.000 | ? | Government, private |
| Radar        | DMI       | 15       | -  | 1.500 | ? | Government, private |
| Forecast     | DMI       | 6.000    | ++ | 42.000 | ? | Government, private |
| PubOrg       | KL,SM,FM  | 1        | - | 1.000 |  1 | Government |
| Platform     | SIT       | 5      | + | 1.000 | 1| DMI, DIGST, SIT |

## Problem
An architecture is a solution to a problem.

Customers of SIT (ministeries and their agencies) are moving towards modern, cloud based platforms to improve time to market for new applications and integrations. SIT currently has no mature, formalised offering to meet this need. The problem can be describe as:

*What service offering will be the most attractive option for public agencies seeking the advantages of 'the cloud'?*

This document describes an initial architecture for a government cloud aimed at becoming customers prefered Operating Model at SIT. It consists of a blue print for a technical solution, a new governance model and a perspective for a future where SIT acts as a cloud broker.

SIT has a small number of suggested operating models that today provides the stability and security required by the customers. This new model is believed to be prefered over existing ones because of the following charactaristics:

- *Continuity of Service.* Existing models allow small and planned windows for maintainance. Cloud technologies typically offers a continuity with rolling updates of both platform and applications without any interuption.

- *Shorter Development and Rapid Changes.* Based on experiences from the proof of concept, customers can expect a rapid deployment cycle. If the suggested goals for deployment and changes are met (see later), the GovCloud will match existing cloud vendors.

To support the first applications SIT must extend existing operating models with new high level use cases.

- *Public Data Distribution.* A private company wants to access data from a public organisation. SIT has suitable operating models and technology platform to support the intentions in the directive on the re-use of public sector information. The government organisation holding data leaves the operational aspects to SIT in order to focus on tailoring the data service applicatin and to help the private users to understand the data.

- *Application Development.* A governement organisation decides that GovCloud is the future home for a new application. Early in the process SIT helps to identify reusable services and data on the GovCloud.    SIT provides a sandbox environment and a toolchain for developers to produce initial proof of concepts. DIGST supports the project

<br>
Furture versions of the GovCloud is expected to add capabilities supporting  *Compliance as a Service, Development Procurment Framework, Sharing of Sensistive Data, Reuse Applications/Services, Hybrid Cloud/Scale Out*, and *Migrating Existing Applications*. [See appendix]



## Principles
Good architecture is based on shared principles that assists solutions in handling future unforseen problems, allowing the GovCloud to evolve with less escalation of desicisions, and clarifying where substantial diagreement exists.

The following principles has been identified:

**_Continious service availabilty_: GovCloud platform and application services are build to deliver uninterupted service even during new releases and platform maintainance.**

Applications used by public agencies are often critical, not only to the agency itself, but to the society in general. Even so, some services have traditionally had so called service windows, where services were suspended and to allow for new software relases. Digital self-services have changed this. The general public is now serving itself at times suitable for the costumer instead of the service provider.

This means deployed services run continuously and must be build accordingly. Cloud technology can enforce some of this, but services must be designed for high availabilty, automated testing and detailed monitoring.

Problems must be solved imidiately and in close collaboration between platform consumers, platform providers and software vendors. The GovCloud provides clear seperation of responsibilities, but recognizes that solutions are found in collaboration, and that the collaboration must be supported efficiently tools provided as part of the GovCloud.

High availability is not only a concern for the platform it self, but is a result of carefull planing across all dependencies from electrical power, bandwidth, incident reaction time and capacity to solve problems when they arise.

Service availability is an extension of the cloud characteristica of measured services. THe health of the platform and it's individual services most be continiously monitored.


**_Vendor Neutrality:_ Applications and data shall be movable from one cloud platform to another without unreasonable effort.**

Public agencies can not allow their data or applications to be locked-in to a specific vendor. From a regulatory point of view, public procurement should support competition and not favour a specific propitary tehcnology or sole vendor. From a strategic perspective, it should be possbile to move public services between organisation, and additionally have them  intergrated into new operational landscapes. This principle supports the characteristic of provider resource pooling.

Exposed interfaces are standardized and supported by Open Source implementations. Interfaces towards customers and interfaces exposed internally between platform and applications shall be selected on the basis of their support in the open source community. Selecting interfaces suopported by open source ensures a licens-free fall back option, if the benefits of licensed implementions are not balanced with the price. Standardization ensure a clear governance of changes and transparent terms of use.

Applications are containarized. By choosing widely adopted container technologies the binding between applications and operation environment is broken. Containarized applications declare their required ressources and relies on configurations from their environement.

Propriatary technolgies are used with caution. When used, the imidiate benefits needs to be evaluated against future costs of the binding. A part of the evaluation is to describe a likely exit strategy for replacing propiatary technology with more open.

Furthermore applications are containerised. By choosing widely adopted container technologies the binding between applications and operations environment is broken. Containerised applications declare their required resources and rely on configurations from their environment.


**_Faster Development of IT:_ The GovCloud platform, tools and business processes support governement organisations in reducing the time from it-project initiation to it-service delivery**

[translate]
Ingen udbudsproces på adgang til platform og toolchain
Fuld understøttelse af DevOps-udvikling
Friktionsløb transition fra prototype, til test og til produktion
Høj grad af umiddelbar GDPR-complience


**Predictable Cost: The operating model ensures predictable consumer costs suitable for public sector budget guidelines.**

Government organisations are interested in fixing variable Costs, or at least having defined caps, to control risk and comply with guidelines. The GovCloud cost model must align well with other budget items and not expose consumers to greater economic risks than other technological solutions.

Data services used by government organisations should generally be developed by the data consuming organisation. But this does not help to limit costs when data services are exposed to the general public. In this case *fair use* agreements could be made with data consumers and their compliance being monitored.

Costs should reflect the use, maintainance and continiously improvement of the GovCloud. Consumers with services deployed on the platform should not be required to contribute beyond the initial agreement for continued hosting. In the case of new services or considerable change in use patterns, costs should re-negotiated.

<br>
In future versions new principles may be included e.g. *Cloud Broker*, *Compliance as a Service*, *Reuse of data and applications*.[See appendix]

The GovCloud is also expected to support a larger government initiative on benefitting from cloud technology. A future strategic general principles could look like the following:

**_Cloud First:_ Cloud technologies are prefered when designing new applications and new integrations between existing applications.**

Cloud technology is maturing and has proven to support large scale operations and rapid development. The essential charateristics of a cloud are Consumer on-demand self-service, Broad network access, Provider resource pooling, Rapid elasticity and Measured services cf. [NIST](https://csrc.nist.gov/publications/detail/sp/800-145/final).

Cloud First means that cloud technology shold always be considered when designing. Simply because the above mentioned characteristica are generally desirable and for the foreseen future best can be reached through the use of cloud technology. A Cloud First principle etails second and perpherps third alternatives. Organisations should always choose the best tool for the job, duly respecting the relative long life time of government it-solutions and the everchanging overall organisation.




## Reference model
To identify the different components in the architecture, we use a conceptual model based on a number of excisting frameworks, including
[Microsoft Cloud Service Foundation Reference Model](https://blogs.technet.microsoft.com/cloudsolutions/2013/08/15/cloud-services-foundation-reference-architecture-reference-model/), [IBM Cloud Garage Method](https://www.ibm.com/cloud/garage/), [OpenGroup IT4IT](http://www.opengroup.org/it4it) and [NIST Cloud Computing Reference Architecture](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication500-292.pdf). A total detailed view of all elemements can be found in appendix of this document.


![](areas.svg)

[include (Gov)roles Cloud Consumer, Cloud Provider, Cloud Policy Owber, Application Responsible, Application Developer, Data Responsible. And correct use in the business area description. ]

The business processes around a cloud platform can be organized into four main areas:


*Platform Delivery.* This area is responsible for translating consumer requirements into platform services. Capabilities and technologies are provided with a specific service level agreement. All changes follow a transparent governance process with consumer involvement,.

*Development.* This area translate requirements into application services. Development is primarily done by third party developers acting on behalf of a Platform Consumer, but can also be done by a Platform Consumers employees. Platform services follow the same processes and are developed by SIT employees or third parties on behalf of SIT. Application services can generalised into platform services in a collaboration between Platform Provider, Policy owner and the Consumer owning the applicaiton.

*Operations.* This area encapsules processes applied to the platform and its applications to meet the requirement in service level agreements. Processes are typically highly automated to minimize human error and labor. [end user support? behaviour?]

Processes in Development and Operations are increasingly considered as overlapping, especially in the case of self service cloud services, where a consumers take a larger part in the operational aspects of service delivery. One definition of [DevOps](https://en.wikipedia.org/wiki/Special:BookSources?isbn=978-0134049847) *is a set of practices intended to reduce the time between committing a change to a system and the change being placed into normal production, while ensuring high quality.*

*Audit.* Auditing are processes of independent examination through controls with the intent to express an opinion. An opinion can be on the compliance with standards. Audits are based on objective evidence and may evaluate terms of security controls, privacy impact, performance, etc.

<br>
The four business areas above are supported by technology components in three areas [consider using IT4IT terms]:

*Management and support.* The components in this area supports the capabilities defined by the DevOps business area and support the consumer self-service characteristics of a cloud. Components also provides data to Platform and Service Delivery supporting Meassured Services and fair billing.

*Platform.* Platform components are aggregated with Infrastructure and Management and Support components to provide Platform as a Service (PaaS). Platform components are mostly provided as services to be consumed by applications, but they may also be consumed directly by end-users.

*Infrastructure.* Infrastructure components provide the necessary environment to run the platform. Infrastructure can be on-premise or extended with Infrastructure as a Service from an private provider. Infrastructure is heavily-standardized to facilitate both automation in the environment, and to optimize volume purchases of hardware and software.


## Design
The initial design of the GovCloud consists of a number of design decisions and the rationals behind them. Decisions are named in bold and brackets throughout the description of each element. During the establishment decisions can be changed following the established service lifecycle management processes.

The business areas (green) of the reference model is the focus of the interaction between GovCloud consumers and GovCloud provider. The technology areas (blue) are included to verify that business processes are supported by tehcnology and that no technology areas are left un-governed.

### Platform Delivery
![](delivery.svg)

Statens IT is the strategically appointed provider of IT operation and service to the Danish Government and shall as such provide the requested cloud environment.

**[PaaS]** Government Cloud is a Platform as a Service offered by SIT within existing license to operate.

NIST defines the capability provied to the consumer in the PaaS operating model as: *to deploy onto the cloud infrastructure consumer-created or acquired applications created using programming languages, libraries, services, and tools supported by the provider. The consumer does not manage or control the underlying cloud infrastructure including network, servers, operating systems, or storage, but has control over the deployed applications and possibly configuration settings for the application-hosting environment.*

PaaS is choosen over IaaS to limit the ammount of operational knowledge required by government organisations. SIt is setup to lift this requirement from other organisations. [more?]

As such, consumers are responsible for the developement and maintainance of applications, data management, awarding and revoking user rights and licensing of software. SIT as a Platform Provider is responsible for updating platform software, automated testing of both applications and platform during updates, monitoring and reporting on services.

 SIT's existing SaaS offering will still be provided. SIT may use the GovCloud as a basis for SaaS offerings to further harmonize the operational environment.

[Verify that we do not need to change anything regulatory about SIT]

**[Operating Model]**  SIT defines a new Operating Model (da. driftsmodel) in the existing framework.

SIT has established business support functions across a few operating models. Initially PaaS will be a supplement to existing models and will benefit from establised practices concerning agreements, reporting and financing.

The GovCloud operating model is based on a collaborative agreement between  government organisations and follows traditional practices. Most importantly this does not allow for economic sactions and private law contracts. Conflicts needs to be solved through excisting government fora and budgetting practices.

GovCloud Platform Consumers will experience one account manager? from SIT covering all operating models e.g. location networking, employee personal computers and custom applications.


<br>
For the initial applications processes related to the management of Platform Service Lifecycle and Platform Service Level needs to be established.


#### Service Lifecycle
Transparent governance process are necessary for Platform Consumers to evaluate fit-for-porpuse of the operating model.

**[Customer driven]** The service life cycle of GovCloud is based on consumer needs, in a baglog maintained by SIT, and prioritized by a joint public group lead by DIGST in corporation with SIT.

Establishment of platform services, changes to service level agreements and exposed interfaces are the primary areas of governance. To support the principle of vendor neutrality supported interfaces most be carefully curated. And the choices should support the more general 'business' strategy.

In a two-way negotiation between consumer and provider on individal projects, the overall strategic goals of goverment-it is at risk of taking second priority. To ensure the allignment of overall strategy and it-roadmaps the responsibility of roadmap decisions is placed with the Platform Policy Owner.

**[Support lifetime]** Each supported technology, interface and platform service in GovCloud has a planned minimum lifetime.

The products used to implement the platform will likely have many features that are less desirable to have an application depend on. To support the principle of vendor neutrality (and its goal of moveable applications) only a subset of said features is selected and supported.

When designing applications, Platform Consumers must make informed decissions about the use of available features of GovCloud. Therefore planned support lifetime for each feature must be explicit. For technologies the vendor support and for interfaces the release plans of standard organisations should be taken into consideration. Platform services are more locally controlled and the support time can be agreed upon among current service users.

Application developers may have valid reasons to use unsupported services, and
often development time and the code lines can be greatly reduced by clever use of a platform. When applications rely on unsupported features it is important to estimate the immidiate savings and compare those with  future costs in the event of unsupported features becoming unavailable.

Unsupported features will be used and Platform Consumers should be alerted as soon as they are brought to the attention ofg the Platform Provider is aware of planned changes e.g. in updated roadmaps from technology providers.

#### Service Level
The selected operating model (PaaS) separates responsibilities between the Platform Provider and the Platform Consumer. However, in government collaboration, a running platform with a failing application is a failed public service. Citizens and businesses  only care that the service is brought back up and not what part of government (or even private vendor) is to blame. As such, service levels and separation of duties are designed to support a common goal of high service availability.

**[24/7 platform]** SIT continously monitor all services, reports swift on incidents, initiate problem solving and bring in support from external professional services when necessarry.

When SIT identifies a failing service an incident is created. First efforts are made to restart services and identify underlaying problems. SIT can not be expected to have knowledge about the internal workings of applications, and if first efforts does not bring services up, the service provider is involved.

**[24/7 services]** Platform Consumers wanting to host 24/7 application must provide resources to collaborate with the Platform Provider on solutions to incidents.

Platform Consumers help identify problems by providing knowledge of the inner workings of applications. When Platform Provider and Platform Consumer agree on the problem a suggested solution is decided upon. Solutions can be fixes to platform services, workarounds delivered as new application versions or combinations hereof.

Highly available services are a result of carefull design, early detection of problems and the required capabilities to fix them. Carefull design is supported by devepoment guidelines and general cloud practices. Detection of problems is supported by automated testing and health monitoring. Required capabilities covers both specific products, their configuration, dependencies and underlying infrastructure. The availability and cost of these support from technology providers must be considered when deciding the roadmap and should be contractually specifie by the Platform Provider when possible.

Processes of identifying and resolving problems are separated from incident management. SLA should also govern Platform Customers’ responsibility to participate in this process when needed.


### Platform Operations
![Platform Operation](operations.svg)

Existing established processes at SIT are not suitable for DevOps and automation. Since ITIL and IT4IT are well supported in existing tools and a considerable amount of training has been done both at SIT and it's customers, new processes are based on those frameworks.

**[ITIL]** SIT establishes processes suitable for cloud platform operations based on the ITIL framework [Check mapping to DevOps].

The required service uptime has consequences for the design of especially the incident process. The time of incident (during normal business hours, weekends or international holidays) will influence e.g. what contact information to use, what resources are preferred and when to report to management.

The initial application will have impact on existing processes for Access Management, Configuration Management and System Administration.


#### Access Management
The Public Data Sharing use case ,combined with the specifc need to identify consumers of the DMI data, is not covered by excisting asscess management at SIT.

**[API Keys]** Public Data Sharing is supported by a GovCloud platform service for managing of API keys.

Specifically, the Platform Consumer establishes processes for on-boarding data consumers and SIT provides a back-end service to generate and store API keys and contact information.

The API Key management should be generic and be used for all applications that share public data with private businesses and the public in general.

#### System Administration
Existing SIT SysAdm tools are chosen for the support of the operation of an environment  dominated by Windows OS.

The GovCloud will be based on Linux and employees are not expected to operate in both environments. Furthermore the 24/7 operation might require employess to work from home or on the road.

**[SysAdm]** SIT chooses tools suitable for automation and remote management based on individual experiences.

Since the efficacy and comfortableness of platform operators have a huge impact on service levels and quality of solutions, the choice of tools must also take into account individual preferences.

#### Configuration Management

The configuration of GovCloud is done internally in SIT. For the first version, configuration changes to applications are sent to SIT and manually applied. This process is covered by the SLA.

**[Config]** Tools chosen for configuration management must support implementing self-service for application owners at a later stage.


Configuration is under version control and should have high availabilty matching other critical parts of the platform.


### Service DevOps
![](devops.svg)

The development and operation of applications must be supported by an efficient tool chain. To help government organisations adapt agile development in a cloud setting, a joint public, fully supported tool chain is chosen and provided as part of the GovCloud Platform.

The use of the toolchain is recommended and can function as a guide for competences across development vendors. However, not all Platform Consumers (and more importantly their developers) can be expected to adhere to tool choices made by Platform Policy Owner. Consequently

**[Gov Dev Tool]** SIT offers an enterprise grade 'Government Development Toolchain' as Software as a Service to support agile application development

The toolchain will consist of professional, enterprise grade tools.  SIT offers the toolchain preconfigured and integrated with existing user and access management. Licenses are provided by customers or procured in bulk by SIT where possible.

End-user support and traning is done outside of SIT.

The initial toolchain is based on Jira, Git, Jenkins and SOAP UI.


**[Consumer Tool]** Platform Consumers may choose between SIT’s SaaS tool chain and providing their own tool chain, contingent on the Platform Consumer’s tool chain’s complete integration with the build and test processes from SIT.

The build and test process are required to follow the SIT defined flow to allow SIT to rebuild images and reploy services after changes on the platform.





#### Build

**[Build Image]** Docker images are build from source using custom image maintained by SIT

In the very definition of PaaS, the provider chooses which *programming languages, libraries, services, and tools* to suopport.  The custom build and test images defines the supported technology stack on the platformn. The GovCloud aims to provide a seamless process of bringing services into production. The custom build and test image allows developers to replicate the core of the production environment on their local maching. The build and test image is governed as part of the generel service life cycle.


#### Test

**[Test Image]** Automated test of services are done using a custom image maintained by SIT.

As above, this allows the test to be carried out in an environment that closely match the one used in production.

**[Acceptance test]** Service passing the provided automated tests are considered running.

Because the same virtual machine is use to build and test services at both the consumer and provider, the automated test can also be used as a form of acceptance test. That is, the GovCloud provider can rely on the test to verify that a service is running after an upgrade of the underlying platform. A side effect to this, is that if a service is behaving un-expected after a platform update, new tests should be write to provide better test coverage for future updates.



**[Sandbox]** SIT provides free-of-charge GovCloud sand boxes for all existing SIT customers.

Sand boxes can also be provided for 3rd party developers if requested by SIT customers. Sand boxes have no support, no SLA and will be erased after a specified number of days.

Sand boxes can help the uptake of the GovCloud among existing customers and private vendors interested in providing developers to government agencies can familiarize them self with the prefered setup before project establishment.


#### Release
**[Release]** Consumers label images in the repository for release based on test results.

#### Deploy

**[Deploy]** In the initial version releases of new versions of applications services are done manually by SIT on request from customer.

[Automate later, webhooks in GIT....]


**[Elastic?]** Every service is deployed with a scaling schedule?


#### Operate

**[SharedOperation]** SIT provides tools to support collaboration during normal operation and during incident handling.




### Audit
![](audit.svg)
Auditing features are not in scope for the initial version of GovCloud.


<div style="page-break-after: always;"></div>

[the following is to be discussed in details with SIT]

----------


### Management and support
![](support.svg)

>Describe intention about DevOps through selfservice, Same views and (mostly) controls as SIT employee.

[Consider adding communication support]

- No Portal in first version
- No detailed per usage Billing in first version
- Process Automation (left to the team to build ad hoc)
- Authorization (not needed in the first two applications. Future services can use attributes from datasets and roles/rights from AD)
- Data protection (use build in platform, but still processes)???
- Deployment and Provisioning (reuse existing)
- Network Support (use existing)

**[Support]** Deployment and provising of hardware, network support and data protection...


#### Service Monitoring

**[Monitoring]** Applications and services implement a common  schema for monitoring, logging...  and are monitored and reported in SITs existing tool (Nagios?)|

>Monitoring adskilt fra Reporting
[Tegning af service i container]
[Ping and trace]
[Log content and format]

> Ping, Trace, CallId


#### Service management
> This component consumes Service Monitoring data and produces reports that describe the actual service level metric values exhibited by a service over regular time intervals. The report data can be compared to SLAs to determine whether the service met its SLAs during the reporting interval that is specified in the SLA. The data from this component is provided to consumers through the Consumer and Provider Portal component. This component is a primary enabler for the Service Level Management and Business Relationship Management components.

> This component monitors service levels of all technical capabilities that are used to provide each cloud service. The Service Reporting component consumes the data from this component. Optimally, the Service Monitoring Component is able to integrate with the Service Management component so that it can auto-generate incidents based on defined criteria.

> This component supports most of the Service Operations components and integrates data from the following Management and Support components:

> * Incident and Problem Management
> * Configuration Management
> * Service Monitoring
> * Service Reporting

>The data integrated by the Service Management component is typically exposed through the Consumer Portal component so that various individuals can view it.


#### Configuration Monitoring


#### Authorization
**[Rights]** All access rights (end-users and other services) are done by service or data responsible

**[Authorization]** Access policy on service level is enforced in Gateway, Access policy on data level in Service

> consequence that SIT needs to know API keys.

**[OAuth2?]**

#### Authentication

**[Fed]** Authentication of end-users are done in feuderation
> SIT established trust to idp

**[Attribute Based Access Policy]** only?


#### Directory


**[AD]** Users, Applications, Services and Dataset are ressources registered in SITs existing Active Directory

Only employees and platform devops. Other users in trusted datasets.

#### Data protection

#### Fabric Management

#### Artifact repository

**[Registry]** The artefact repository is [Docker Registry Server](https://docs.docker.com/registry/deploying/#use-an-insecure-registry-testing-only).

Configuration of environments are done via management.

Artefact are identified in the AD, semantic versioned and taged (production, preprod, latest...)


### Platform
![](platform.svg)

**[Layers]** Three seperate layers: gateway, application, data

> rationale from compliance, moveability, data management


**[Vert?]** Either common or Consumer.

[Platform services til vedligehold af Data Access API, kunne genbruges på tværs af data sets?]

[List expected platformservices in version 1]

#### Gateway

**[KrankenD]** The API Gateway is [KrakenD](http://www.krakend.io/)

> rational deom scaleability, distributed configuration, OAuth

> SSL termination,Consider ClientMaxRate, Act as circuit braker, Operated by Cloud Platform Team

Sandboxes outside, unprotected and with limited ressources.

Test inside but seperate gateway?


#### Application fabric

**[Kubernetes]** The application environment is [Kubernetes](https://kubernetes.io/)

> rationale: No need for management tools yet, Kubernetes is the core technology, Selfservice and automation is build on top in future versions.

**[Service classification]** Service layers: data, business, frontend

Relation to gateway

Compute Ressource Quota

Application consist of a few controllers with pods with images.

#### Data fabric

**[MapR]** The data fabric is [MapR](https://mapr.com/)

> rational: quick start, manageability,access control, scale out, clustering

### Infrastructure
![](infrastructure.svg)

**[Scale out]** Scale out and multiple cloud providers as needed, but not initial**
- on premise because we want to test and prepare SIT to handle sensitive data


[Consider Hardware certification??]

**[On-premise]** The on-premise application and data fabric runs on non-virtualized hardware under CentOS**

- no Virtualization to reduce complexity/licensing and performance storage

- same os to minimize learning, but specific to cloud, but seperate for tuning


[decision?]Active/Active Cross..



#### On-premise Compute
> This component represents physical servers, which include resources such as processors, graphics processing units (GPUs), random access memory (RAM), network interfaces, and the storage necessary to host hypervisor software for the physical server.

> This component represents physical storage that is accessed by Compute devices via some networking technology. Types of data that are often stored on this component are virtual machine hard disk files or consumer data or both. Although the Infrastructure and Management and Support components that are necessary to provide services in the infrastructure as a service (IaaS) service model1 exist in the CSFRM, they are not represented solely to enable IaaS services. They’re represented because they’re necessary to enable any type of cloud service.

#### On-premise storage

#### Network
> This component represents the physical network switches, routers, firewalls, and cabling. It also represents logical networking constructs including virtual local area networks (LANs), access control lists, quality of service, and network interfaces defined in converged network architectures.


[Network in Kubernetes]

**# What kind of seperation? **

[What about IP6 internally/eternaly]

## Appendix

### 2019Q2

Platform goals for first version:

- From prototype to production < 1w, Chages in production < 1d
  - supported by toolchain.
  - build and test shared by dev and ops.

- Rebuild services on platform updates
  - automated test and acceptance.
  - multiple versions of same services.

- Performance and near liniar scaling
  - Service monitoring and reporting
  - ressource limiting

### Future releases


#### Version 2


#### Version 3


#### Version 4


#### Principles

**Cloud Broker** - cloud services are consumed through a central cloud broker.

Regulatory issues on the use of public cloud services for sensitive personal data in a government settings are still unclear. Even with clearification, some critical data are still to be kept on danish territory and under strict control. But even critical applications need better time to market and cloud technologies can support this. Hence the need for a onpremise infrastructure based on cloud technologies.

At the same time the cost efficiency of public cloud offerings are hard to match. But government organisations will soon find integration of cloud services can be too complexto manage. A cloud consumer may request cloud services from a cloud broker, instead of contacting a cloud provider directly. A cloud broker is an entity that manages the use, performance and delivery of cloud services and negotiates relationships between cloud providers and cloud consumers. [NIST definition of Cloud Broker](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication500-292.pdf)

The cloud broker will take advantage of a competitative market by moving applications to the most best available platforms. Reason can be applications with no personal data or when needed capabilities are only accessible as SaaS at cloud providers.

-----

Furture versions of the GovCloud is expected to add capabilities  on

- *Compliance as a Service.* The GovCloud will differ from existing cloud vendors in regard to establising and assuring compliance with regulatory and strategy requirements. Clarification of compliance can add years to project time and is a major barriere to better time to market. The GovCloud will over time establish more compliance assurances and offer them as shared services. The focus will initial be on data protection, public procurement, and the joint public digitalisation strtegy.

- *Development procurment framework* Since the GovCloud is expected to be used by many public organisations, the general software and development market will be familiarized with the environment and it processes. In a market perspective, the GovCloud can function as a harmonization of services, which can lead to an increased and more transparent competition. This can further be supported by a common framework for procuring application development build to be hosted on the GovCloud.

- *Hybrid Cloud/Scale Out?*
[Expand]

to support a number of new use cases

- *Sharing of sensistive data*
An existing customer at SIT wants to access data from another organisation. The data is not available at any existing dataservices. SIT suggests the data owner to replicate the data onto the GovCloud. The data user builds a custom dataservice and reuses existing security controls incl identity management.

- *Reuse Application/Service.* A software vendor delivers an application to a customer of SIT. The vendor wants to deploy on the GovCloud preparing for more customers. The vendor sells a license to another SIT customer and SIT extends the installation and the software product is available to the new customer.

- *Migrate existing application.* SIT has identified a customer application that is sutiable for hosting on the new GovCloud. SIT plans a transition with the customer and reuse a number of exsiting services and datasets in the Cloud and can turn off some application elements.



* Formalized operation model

* self service and DevOps

* Consumer Portal

* Authorisation and Authentication

* Automated Billing

### Processes

>Processes likely to be supported in existing Service Now tool
- Request Fulfillment
- Change Management
- Knowledge Management
- Incident and Problem Management

>Processes likely to be supported by new tools decided by the GovCloud Team
- Access Management
- Asset and Configuration Management
- Systems Administration
- Release and Deployment Management

>and...
- Create identities for Dataset and Application Instance
- Re-build, Test
- Deploy
- Capacity and Scaling
- Maintain images


> Sign up as Customer
- Establish electronic identities
- Create data-domain (Volume in MapR)
- Assign rights to Customer (SIT User with ACR)
- Create a Data Collection
- Describe using template → Publish
- Decide security controls
- Data controller agreement with Platform
- Plan additional controls?
- Place in data-domain and establish DEV/TEST/PROD

> Sign up as a Developer?
- Establish electronic identities
- Platform GIT project
- Education/Guidelines/Helloworld?
- Licens/Ownership?

> Request changes on platform? create topics...? create volumes?
- Deploy one or more  service instance
- Identify on GIT
- Test criteria
- Data agreements
- SLA/Monitoring
- Sign up as Service Consumer
- Agreement with service owner, data responsible, SIT
- Firewall?
- Licensing?

### Barriers

A number of barriers to the change of pace has been identified [more about how?].

- Compliance to legal and strategic requirements is a very time consuming aspect and has been extending both large and smaller projects with periods of years. Public procurement, personal data protection and protection of national infrastructure are highly regulated areas, but also characterized by generic and re-usable concrete elements. Strategies are developed on many levels and in many domains, thus a single project or application will be covered by many principles and requirements. Sometimes the strategies align well, other times not so much.

- Budget scope. Typically data are stored in one application financed by the data reponsible, but can be used by another organisation. Hence the cost usually appear on one budget, whereas the benefits is to be found at another.

- Small professional environments. Public administrative organisations are too small to carry a full professional environment for efficient/agile development. Even that IT plays an ever big role for efficient government, very few organisations has managed to build and maintain their own development.

- Sparse knowledge about application and data landscapes of other organisations. Even when organisation cooperate and depend on each other information about existing application and data with potential reuse is hard to come by.

- Service differentiation. Cloud technology is maturing but product categories, and more important their interfaces, are still plenty. Interoperability and 'moveability' of applications is typically not a priority in an emergent market where service differentation is a driver. This results in a big challenge for the individual organisation and puts them in risk of significant vendor lock-in.


### Summary of decisions

1. **[PaaS]** Government Cloud is a Platform as a Service offered by SIT within existing license to operate.
1. **[Operating Model]**  SIT defines a new Operating Model (da. driftsmodel) in the existing framework.
1. **[Customer driven]** The service life cycle of GovCloud is based on consumer needs, in a baglog maintained by SIT, and prioritized by a joint public group lead by DIGST in corporation with SIT.
1. **[Support lifetime]** Each supported technology, interface and platform service in GovCloud has a planned minimum lifetime.
1. **[24/7 platform]** SIT continously monitor all services, reports swift on incidents, initiate problem solving and bring in support from external professional services when necessarry.
1. **[24/7 services]** Platform Consumers wanting to host 24/7 application must provide resources to collaborate with the Platform Provider on solutions to incidents.
1. **[ITIL]** SIT establishes processes suitable for cloud platform operations based on the ITIL framework [Check mapping to DevOps].
1. **[API Keys]** Public Data Sharing is supported by a GovCloud platform service for managing of API keys.
1. **[SysAdm]** SIT chooses tools suitable for automation and remote management based on individual experiences.
1. **[Config]** Tools chosen for configuration management must support implementing self-service for application owners at a later stage.
1. **[Gov Dev Tool]** SIT offers an enterprise grade 'Government Development Toolchain' as Software as a Service to support agile application development
1. **[Consumer Tool]** Platform Consumers may choose between SIT’s SaaS tool chain and providing their own tool chain, contingent on the Platform Consumer’s tool chain’s complete integration with the build and test processes from SIT.
1. **[Build Image]** Docker images are build from source using custom image maintained by SIT
1. **[Test Image]** Automated test of services are done using a custom image maintained by SIT
1. **[Acceptance test]** Service passing the provided automated tests are considered running.
1. **[Sandbox]** SIT provides free-of-charge GovCloud sand boxes for all existing SIT customers.
1. **[Release]** Consumers label images in the repository for release based on test results.
1. **[Deploy]** In the initial version releases of new versions of applications services are done manually by SIT on request from customer.
1. **[Elastic?]** Every service is deployed with a scaling schedule?
1. **[SharedOperation]** SIT provides tools to support collaboration during normal operation and during incident handling.
1. **[Support]** Deployment and provising of hardware, network support and data protection...
1. **[Monitoring]** Applications and services implement a common  schema for monitoring, logging...  and are monitored and reported in SITs existing tool (Nagios?)|
1. **[Rights]** All access rights (end-users and other services) are done by service or data responsible
1. **[Authorization]** Access policy on service level is enforced in Gateway, Access policy on data level in Service
1. **[OAuth2?]**
1. **[Fed]** Authentication of end-users are done in feuderation
1. **[Attribute Based Access Policy]** only?
1. **[AD]** Users, Applications, Services and Dataset are ressources registered in SITs existing Active Directory
1. **[Registry]** The artefact repository is [Docker Registry Server](https://docs.docker.com/registry/deploying/#use-an-insecure-registry-testing-only).
1. **[Layers]** Three seperate layers: gateway, application, data
1. **[Vert?]** Either common or Consumer.
1. **[KrankenD]** The API Gateway is [KrakenD](http://www.krakend.io/)
1. **[Kubernetes]** The application environment is [Kubernetes](https://kubernetes.io/)
1. **[Service classification]** Service layers: data, business, frontend
1. **[MapR]** The data fabric is [MapR](https://mapr.com/)
1. **[Scale out]** Scale out and multiple cloud providers as needed, but not initial**
1. **[On-premise]** The on-premise application and data fabric runs on non-virtualized hardware under CentOS**



### Referencemodel

![Referencemodel](reference.svg)
