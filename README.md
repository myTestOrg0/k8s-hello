Deploying into a new kubernetes cluster
===============

1. Update `strategy.matrix.env` and `strategy.matrix.registry` in `.github/workflows/ci_alpha.yaml`
2. Update `strategy.matrix.env` in `.github/workflows/ci_beta.yaml`
3. Create values file `values-k8s-<env>.yaml` in `helm-chart` and update registry and ingress hosts.
