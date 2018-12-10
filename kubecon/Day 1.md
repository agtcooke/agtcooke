# Weaveworks: Procuction Ready Kubernetes

* Weaveworks => gitops. not vendor specific
* CEO chair of tech oversight committee CNCF
* Slides: http://tinyurl.com/production-k8s-2018
* [WeaveWorks Flux](https://github.com/weaveworks/flux)
* [WeaveWorks Scope](https://github.com/weaveworks/scope)

## TLDR

* both application and cluster level operations have broad bases to cover
* treat CI and CD as completely separate animals
  * CI produces images
  * CD is highly automated
    * k8s configuration lives in (its own) repo
    * the cluster monitors its config repo for changes and reacts autonomously
* lots here to improve upon based on current state

## Top level to-do

* make tracking spreadsheet for all these things
* solicit help during IP time (higher priority/impact guided)
* work with group to prioritize
* consider seperate list/sheet for CI maturity
* consider divorce of CI from CD
* what to do about AI vs OSS / industry standard tools?
  * good topic for later? we have bigger needs
* create the sales pitch for why GitOps
  * huge change
  * will feel expensive
* create a test cluster for flux driven clusters

## Application Checklist

Use slides to feed this section into a spreadsheet.

* Liveness (dead, restart)
* Readiness (load)
* cluster dashboard
* playbooks/runbooks
* limits/requests (how the scheduler makes decisions)
* labels/annotations
* alerts
* structured logging
  * stdout/console for .net apps?
* tracing (dependency tracking)
  * ingress controlled tracing
  * tracing header
* gracefull shutdowns
  * exponential backoff for readiness / dependencies
* configmaps
  * mounted?
  * external to deployment
  * dynamic configuration
  * file watch or polling
  * filewatch leads to not needing to restart the pod
* labels using commit branch/sha
  * map running => code
* locked down runtime and context
  * possible punt to SWG / security teanm

## Cluster Checklist

* build pipeline
* deploy pipeline => devops
* image registry
* monitoring infra
* secret management
* ingress controller
* api gateway
   * ingress:connection, gateway:request
   * why are we rolling our own?
* service mesh
  * tracing w/o instrumentation
  * linkerd/istio
  * how does AI fit in?
* service catalog / broker
* image scanning
  * possible to punt to SWG / security team
* advanced deployment strategies (canary)

## etc

* **RED** => Request, Errors, Delays
* Weave scope is OSS
* Notebooks (dashboards) feed into Playbooks
* Service => GitHub => Dashboard
* Markdown, snapshot current metrics (during problem) + running metrics
* gitops prinicples
   * CS + operation knowledge
   * gitops => agnostic
   * **why** instead of *how*
   * speeds up team
   * increased velocity
   * infrastructure as code, _not_ a series of shell scripts
   * declaritive => changes => transactions
* might we need to change our deployment process?
* stage => live, who does it? (spoiler: devops)
* who owns master?
* master is always live
* cluster pulls in changes from Git
* automated agents
* flips deployment on its head
* CONTROL REPOSITORY
* WeaveCloud: Super gucci kubernetes manager, delicious query syntax, 
* prefer webhooks over API polling for Flux <=> GitHub, see polling limits