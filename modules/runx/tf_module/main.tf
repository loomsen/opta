resource "helm_release" "opta-agent" {
  count      = var.deploy_opta_agent ? 1 : 0
  repository = "https://helm-repo.opta.dev/"
  chart      = "opta-agent"
  name       = "opta-agent"
  version    = "0.1.3"
  values = [
    yamlencode({
      optaAgent : {
        token : var.api_key
      }
    })
  ]
  atomic          = true
  cleanup_on_fail = true
}
