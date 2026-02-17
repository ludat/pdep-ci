#!/usr/bin/env nu


def main [] {
  let workflows = kubectl get workflows -n pdep-ci -o json | from json | get items

  $workflows
  | par-each {|workflow|
    let owner = $workflow.metadata.labels."ci.pdep.com.ar/repo-owner"?
    if $owner == null { return }
    let repo = $workflow.metadata.labels."ci.pdep.com.ar/repo-name"
    let summary = $workflow.metadata.labels."ci.pdep.com.ar/description"
    let sha = $workflow.metadata.labels."ci.pdep.com.ar/sha"
    let result = $workflow.metadata.labels."ci.pdep.com.ar/result"
    {
      owner: $owner,
      repo: $repo,
      summary: $summary,
      sha: $sha,
      result: $result,
      results: (http get $"https://pdep-results.ludat.io/($owner)/($repo)/result-($workflow.metadata.uid).txt" | str trim)
    }
  } | to yaml
}
