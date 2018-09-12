
#

## Basic Concepts

# Reference Model
*[extends Cloud Service Foundation Reference Model with inspiration from IBM Cloud Garage Method and OpenGroup IT4IT]*

## Development
The components in this subdomain serves the Requirement to Deploy processes as it happens at the Customers and their Application Developers. The components in this subdomain represents
- Requirements the Application must fulfill.
- Source code that realises the Application and its Automated Testing
- Processes for the building, testing and deployment of Artefacts.
- Processes for monitoring and evaluating the Applications performance and usage.
The processes must support a rapid build-test and deploy-evaluate cycle with a high level of self-service for the Customers.


### Requirement Tracking
This component functions as an mediate between the Customers business side and Developers of an Application:
- Requirements from a Customer to an Application and possible sources in forms of Policies or Regulations.
- Relations from Requirements to both existing and planned versions of the Source Code and Application
- Relations from Requirements to their Test Cases.

Requirements can also be in the form of an experienced defect that needs to be corrected either in the Source or passed on as Incident to the Cloud Service Operation processes.

### Source Control
This component represent the versioned Source Code of Applications and is used as the basis for the Build Component to create deployable Artefacts.

### Build
This component supports the process of transforming Source Code and other ressources into a deployable Artefact.


### Test and results
This components represents the Test Cases required to demonstrated the fullfillment of Requirements. Tests are performed against Artefacts resulting from a Build of a version of the Source Code. *[Test Data]*
The component it self should be available as an Artefact that is deployable at the Developer.

### Artefact Repository
This component represents the output of the Build and Test component. Artefacts have specific versions and stems from versions of Code in the Soure Control and external sources. Artefact are deployed to form running service instances.

### Deploy
This components supports the process of bringing Artefacts into the Platform. The component is accessbile from the Customer and Developers in form of a self-service. The process supports scaling the number of running instances of Artefacts and allows multiple versions of the same Application/Service to run at the same time to support A/B testing and rolling deployment.

### Monitoring and Logs
This components supports the Consumer and Developers insight into the status and usage of deployed Artefacts/running Applications and Services. Production logs must be anonymized and aggregated to protect the end user of applications.

### Usage analytics
This component supports the continious improvement of Applications through analytics of end user behaviour.
