#!/usr/bin/env bats

setup() {
  source "${BATS_TEST_DIRNAME}/../functions"
  source "${BATS_TEST_DIRNAME}/../profile.d/mercurial"
}

@test "[profile_d_mercurial] Check if the mercurial recursive pull function is present" {
  [[ "$(type -t recursive-hg-pull)" == "function" ]]
}

@test "[profile_d_mercurial] Check if the rhp alias is available and set properly" {
  run alias rhp
  [ "$output" = "alias rhp='recursive-hg-pull'" ]
}

@test "[profile_d_mercurial] Check if the mercurial recursive update function is present" {
  [[ "$(type -t recursive-hg-update)" == "function" ]]
}

@test "[profile_d_mercurial] Check if the rhu alias is available and set properly" {
  run alias rhu
  [ "$output" = "alias rhu='recursive-hg-update'" ]
}
