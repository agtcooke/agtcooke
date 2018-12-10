# Weaveworks: Procuction Ready Kubernetes

* Weaveworks => gitops. not vendor specific
* CEO chair of tech oversight committee CNCF
* Slides: http://tinyurl.com/production-k8s-2018
* The magic sauce: https://github.com/weaveworks/flux

## Legend

* `[w]` => work item
* `[f]` => future topic

## Top level to-do

* `[w]` make tracking spreadsheet for all these things
* `[ ]` consider seperate list/sheet for CI maturity
* `[ ]` Full divorce of CI from CD
* `[ ]` solicit help during IP time (higher priority/impact guided)
* `[w]` work with group to prioritize
* `[ ]` what to do about AI vs OSS / industry standard tools?
* `[ ]` create the sales for why GitOps
* `[ ]` create a test cluster for flux driven clusters

## Application Checklist

Use slides to feed this section into a spreadsheet.

* `[w]` Liveness (dead, restart)
* `[w]` Readiness (load)
* `[w]` cluster dashboard
* `[f]` playbooks/runbooks
* `[f]` limits/requests (how the scheduler makes decisions)
* `[ ]` labels/annotations
* `[ ]` alerts
* `[w]` structured logging
   * `[ ]` stdout/console for .net apps?
* `[ ]` tracing (dependency tracking)
   * `[f]` ingress controlled tracing
   * `[ ]` tracing header
* `[ ]` gracefull shutdowns
   * `[ ]` exponential backoff for readiness / dependencies
* [w] configmaps
   * `[ ]` mounted?
   * `[ ]` external to deployment
   * `[ ]` dynamic configuration
   * `[ ]` file watch or polling
   * `[ ]` filewatch leads to not needing to restart the pod
* `[w]` labels using commit branch/sha
   * `[ ]` map running => code
* `[ ]` locked down runtime and context
   * `[ ]` possible punt to SWG / security teanm

## Cluster Checklist

* `[ ]` build pipeline
* `[ ]` deploy pipeline => devops
* `[x]` image registry
* `[ ]` monitoring infra
* `[ ]` secret management
* `[ ]` ingress controller
* `[ ]` api gateway
   * ingress:connection, gateway:request
   * why are we rolling our own?
* `[ ]` service mesh
  *  `[ ]` tracing w/o instrumentation
  *  `[ ]` linkerd/istio
  *  `[ ]` how does AI fit in?
* `[ ]` service catalog / broker
* `[w]` image scanning
  * `[ ]` possible to punt to SWG / security team
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